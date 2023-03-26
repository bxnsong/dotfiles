{ config, pkgs, lib, ... }:
let
  inherit (lib) mkOption types;
  inherit (config.ben) username homeDirectory;
in {
  imports = [ ./starship.nix ./packages.nix ./zsh ./tmux ./neovim ./ranger ];

  options.ben = {
    username = mkOption {
      type = types.str;
      default = "ben";
      description = ''
        Username of the user to provision on the system.
      '';
    };

    homeDirectory = mkOption {
      type = types.str;
      default = "/home/ben";
      description = ''
        Home directory of the user.
      '';
    };
  };

  config = {
    home = {
      inherit username homeDirectory;
      stateVersion = "22.11";
    };
    programs = { home-manager.enable = true; };
  };
}
