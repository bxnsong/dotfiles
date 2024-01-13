{ pkgs, lib, config, ... }:
with lib;
let cfg = config.darwinApps;
in {
  options.darwinApps = { enable = mkEnableOption "Enable Darwin"; };
  config = mkIf cfg.enable {
    xdg.configFile = {
      kitty = { source = ./kitty; };
      sketchybar = { source = ./sketchybar; };
      skhd = { source = ./skhd; };
      yabai = { source = ./yabai; };
    };
    home.packages = with pkgs; [ spicetify-cli ];
  };
}
