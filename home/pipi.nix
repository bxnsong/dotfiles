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

  services.podman.containers.homepage = { traefik.subDomain = ""; };

  nps = {
    hostIP4Address = "100.72.192.60";
    hostUid = 1000;
    storageBaseDir = "${config.home.homeDirectory}/stacks";
    externalStorageBaseDir = "${config.home.homeDirectory}/.local/share/stacks";

    stacks = {
      # adguard.enable = true;
      authelia = {
        enable = true;
        jwtSecretFile = config.sops.secrets."authelia/jwt_secret".path;
        sessionSecretFile = config.sops.secrets."authelia/session_secret".path;
        storageEncryptionKeyFile =
          config.sops.secrets."authelia/encryption_key".path;
        # oidc = {
        #   enable = true;
        #   hmacSecretFile = config.sops.secrets."authelia/oidc_hmac_secret".path;
        #   jwksRsaKeyFile = config.sops.secrets."authelia/oidc_rsa_pk".path;
        # };
      };

      docker-socket-proxy.enable = true;
      homepage = { enable = true; };
      monitoring.enable = true;

      paperless = {
        enable = true;
        adminProvisioning = {
          username = "admin";
          email = "admin@example.com";
          passwordFile = pkgs.writeText "paperless-pw" "admin1234";
        };
        secretKeyFile =
          pkgs.writeText "paperless-secret" "1234567890abcdef1234567890abcdef";
        db.passwordFile = pkgs.writeText "postgres-pw" "postgres";
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
            john = {
              email = "john@example.com";
              displayName = "John";
              password_file = config.sops.secrets."lldap/john_password".path;
              groups = with config.nps.stacks;
                [
                  # immich.oidc.adminGroup
                  # paperless.oidc.userGroup
                ];
            };
          };
        };
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
      "lldap/jwt_secret"
      "lldap/key_seed"
      "lldap/admin_password"
      "lldap/john_password"
      "traefik/cf_dns_api_token"
    ] (s: { });
  };
}
