{ inputs, lib, pkgs, config, ... }: {
  imports = [
    inputs.nix-podman-stacks.homeModules.nps
    inputs.sops-nix.homeManagerModules.sops
  ];

  home.packages = with pkgs; [ age nodejs_24 sops ];

  nps = {
    hostIP4Address = "192.168.0.169";
    hostUid = 1000;
    storageBaseDir = "${config.home.homeDirectory}/stacks";
    externalStorageBaseDir = "${config.home.homeDirectory}/.local/share/stacks";

    stacks = {
      adguard.enable = true;
      homepage.enable = true;

      traefik = {
        enable = true;
        domain = "pipi.run";

        extraEnv.CF_DNS_API_TOKEN =
          config.sops.secrets."traefik/cf_dns_api_token".path;
      };
    };
  };

  sops = {
    defaultSopsFile = ../secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";

    secrets = lib.genAttrs [ "traefik/cf_dns_api_token" ] (s: { });
  };
}
