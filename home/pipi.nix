{ inputs, lib, pkgs, config, ... }: {
  imports = [
    inputs.nix-podman-stacks.homeModules.nps
    inputs.sops-nix.homeManagerModules.sops
    {
      options.services.podman.containers = lib.mkOption {
        type = lib.types.attrsOf (lib.types.submodule ({ config, name, ... }: {
          labels."traefik.http.routers.${name}.rule" =
            lib.mkForce "Host(`${config.traefik.serviceHost}`)";
        }));
      };
    }
  ];

  home.packages = with pkgs; [ age nodejs_24 sops ];

  # services.podman.containers.homepage = { traefik.subDomain = ""; };

  nps = {
    hostIP4Address = "100.72.192.60";
    hostUid = 1000;
    storageBaseDir = "${config.home.homeDirectory}/stacks";
    externalStorageBaseDir = "${config.home.homeDirectory}/.local/share/stacks";

    stacks = {
      authelia = {
        enable = true;
        jwtSecretFile = config.sops.secrets."authelia/jwt_secret".path;
        sessionSecretFile = config.sops.secrets."authelia/session_secret".path;
        storageEncryptionKeyFile =
          config.sops.secrets."authelia/encryption_key".path;
        oidc = {
          enable = true;
          hmacSecretFile = config.sops.secrets."authelia/oidc_hmac_secret".path;
          jwksRsaKeyFile = config.sops.secrets."authelia/oidc_rsa_pk".path;
        };
      };

      blocky = {
        enable = true;
        enableGrafanaDashboard = true;
        enablePrometheusExport = true;
        containers.blocky = {
          # When clicking the Blocky icon in the homepage, it will redirect to the Grafana dashboard.
          homepage.settings.href =
            "${config.nps.containers.grafana.traefik.serviceUrl}/d/blocky";
        };
      };

      docker-socket-proxy.enable = true;
      dozzle.enable = true;
      glance.enable = true;

      karakeep = {
        enable = true;
        nextauthSecretFile =
          config.sops.secrets."karakeep/nextauth_secret".path;
        meiliMasterKeyFile =
          config.sops.secrets."karakeep/meili_master_key".path;
        oidc = {
          enable = true;
          clientSecretFile =
            config.sops.secrets."karakeep/authelia_secret".path;
          clientSecretHash =
            "$pbkdf2-sha512$310000$R1Pn6Yni4UmzMOJlynDZJw$i634gCIESnLi/pf9j22GT1v8zwLN3ach4fS6CNV6ufGh/jsxBMx7m5wm7VGFMXrE6nrGASr/y/CTKZ2PVr161g";
        };
      };

      lldap = {
        enable = true;
        baseDn = "DC=pipi,DC=run";
        jwtSecretFile = config.sops.secrets."lldap/jwt_secret".path;
        keySeedFile = config.sops.secrets."lldap/key_seed".path;
        adminPasswordFile = config.sops.secrets."lldap/admin_password".path;
        bootstrap = {
          cleanUp = true;
          users = {
            audi = {
              email = "audasia@gmail.com";
              displayName = "Audi";
              password_file = config.sops.secrets."lldap/audi_password".path;
              groups = with config.nps.stacks; [
                donetick.oidc.userGroup
                karakeep.oidc.userGroup
                outline.oidc.userGroup
              ];
            };
            ben = {
              email = "ben.xiao.soh@gmail.com";
              displayName = "Ben";
              password_file = config.sops.secrets."lldap/ben_password".path;
              groups = with config.nps.stacks; [
                donetick.oidc.userGroup
                karakeep.oidc.userGroup
                outline.oidc.userGroup
              ];
            };
          };
        };
      };

      memos = {
        enable = true;
        oidc = {
          registerClient = true;
          clientSecretHash =
            "$pbkdf2-sha512$310000$2CHs7H6n3aG7mN1bn7P./w$ovuvtUakeRaCVQ3M1Is3QjHkxSX8m.kKGPS1TEWAeJxh5Xk3T6dZeNbvGeJwFcq88C2RZtDSxubBz6WPHsA1Bg";
        };
      };
      microbin.enable = true;
      monitoring.enable = true;
      n8n.enable = true;
      donetick = {
        enable = true;
        jwtSecretFile = config.sops.secrets."donetick/jwt_secret".path;
        oidc = {
          enable = true;
          clientSecretFile =
            config.sops.secrets."donetick/authelia_secret".path;
          clientSecretHash =
            "$pbkdf2-sha512$310000$6QbOThHNvD7MaVIOoclmTA$kEsHhPUgX.6d0jdyjxpqqK0.7SycSWr246AHlRoKczEvVD44ITOW7lx1Nzod2RMGAwvUsfsj6wUb.lnSnejCRQ";
        };
      };

      outline = {
        containers.outline.extraEnv.OIDC_SCOPES = lib.mkForce {
          fromFile =
            pkgs.writeText "scopes" "openid offline_access profile email";
        };
        enable = true;
        utilsSecretFile = config.sops.secrets."outline/utils_secret".path;
        secretKeyFile = config.sops.secrets."outline/secret_key".path;
        oidc = {
          enable = true;
          clientSecretFile = config.sops.secrets."outline/authelia_secret".path;
          clientSecretHash =
            "$pbkdf2-sha512$310000$QlE8elv3n//MnWI8ztd7ng$.3kC70DbdhPOuMXB0gtoJwapVGwyHOmNLE0Wge/MTZptepmJOGoWncRs21k.GF4hCE1hAIR8zO46U88ZV9w.mw";
        };
        db = { passwordFile = config.sops.secrets."outline/db_password".path; };
      };

      traefik = {
        enable = true;
        domain = "pipi.run";
        geoblock.allowedCountries = [ "US" ];
        enablePrometheusExport = true;
        enableGrafanaMetricsDashboard = true;
        enableGrafanaAccessLogDashboard = true;

        extraEnv.CF_DNS_API_TOKEN.fromFile =
          config.sops.secrets."traefik/cf_dns_api_token".path;

        # Add Tailscale IP range to whitelist
        dynamicConfig = {
          http.middlewares = {
            ipwhitelist-internal = {
              ipAllowList.sourceRange = [
                "100.64.0.0/10" # Tailscale CGNAT range
              ];
            };
          };
        };
      };
    };
  };

  sops = {
    defaultSopsFile = ../secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";

    secrets = lib.genAttrs [
      "authelia/jwt_secret"
      "authelia/session_secret"
      "authelia/encryption_key"
      "authelia/oidc_hmac_secret"
      "authelia/oidc_rsa_pk"
      "donetick/authelia_secret"
      "donetick/jwt_secret"
      "karakeep/authelia_secret"
      "karakeep/meili_master_key"
      "karakeep/nextauth_secret"
      "lldap/jwt_secret"
      "lldap/key_seed"
      "lldap/admin_password"
      "lldap/audi_password"
      "lldap/ben_password"
      "outline/authelia_secret"
      "outline/secret_key"
      "outline/utils_secret"
      "outline/db_password"
      "traefik/cf_dns_api_token"
    ] (s: { });
  };
}
