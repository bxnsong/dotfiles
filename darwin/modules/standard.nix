{ config, pkgs, lib, ... }:
let
  inherit (lib) mkOption types;
  cfg = config.ben;
in {
  imports = [ ./base.nix ];

  config = {
    nixpkgs = { config.allowUnfree = true; };

    environment.systemPackages = with pkgs; [ kitty ];

    services.nix-daemon.enable = true;

    programs.zsh.enable = true;

    users.users.${cfg.user.username} = {
      name = cfg.user.username;
      home = cfg.user.homeDirectory;
    };
  };
}
