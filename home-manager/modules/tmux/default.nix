{ pkgs, config, ... }:
let nova = import ./nova.nix { inherit pkgs; };
in {
  home = { packages = with pkgs; [ tmux ]; };
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    extraConfig = builtins.readFile ./tmux.conf;
    escapeTime = 10;
    historyLimit = 10000;
    keyMode = "vi";
    terminal = "tmux-256color";
    prefix = "C-a";
    plugins = [ nova pkgs.tmuxPlugins.fpp ];
  };
}
