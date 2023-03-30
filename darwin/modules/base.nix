{ config, pkgs, lib, ... }:
let
  inherit (lib) mkOption types;
  cfg = config.ben;
in {
  options.ben = {
    user = {
      username = mkOption {
        type = types.str;
        default = "bensoh";
        description = ''
          Username of the user to provision on the system
        '';
      };

      homeDirectory = mkOption {
        type = types.str;
        default = "/Users/bensoh";
        description = ''
          Home directory of the user to provision on the system
        '';
      };
    };
  };
  config = {
    homebrew = {
      enable = true;
      global.brewfile = true;
      taps = [ "felixkratz/formulae" "koekeishiya/formulae" ];
      brews = [
        {
          name = "felixkratz/formulae/sketchybar";
          restart_service = "changed";
        }
        {
          name = "koekeishiya/formulae/yabai";
          restart_service = "changed";
        }
        {
          name = "koekeishiya/formulae/skhd";
          restart_service = "changed";
        }
      ];
    };

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      users.${cfg.user.username} = { pkgs, ... }: {

        imports = [
          ../../home-manager/modules/default.nix
          ../modules/sketchybar
          ../modules/skhd
          ../modules/yabai
        ];
      };

      extraSpecialArgs = {
        ben = {
          username = cfg.user.username;
          homeDirectory = cfg.user.homeDirectory;
        };
      };
    };

  };
}
