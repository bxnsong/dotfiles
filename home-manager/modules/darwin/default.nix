{ lib, config, ... }:
with lib;
let cfg = config.darwinApps;
in {
  options.darwinApps = { enable = mkEnableOption "Enable Darwin"; };
  config = mkIf cfg.enable {
    xdg.configFile = {
      aerospace = { source = ./aerospace; };
      kitty = { source = ./kitty; };
      ghostty = { source = ./ghostty; };
      sketchybar = { source = ./sketchybar; };
    };
  };
}
