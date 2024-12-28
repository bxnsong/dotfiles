{ pkgs, ... }:
let
  catppuccin = import ./catppuccin.nix { inherit pkgs; };
in
{
  home = {
    packages = with pkgs; [
      tmux
      tmuxinator
    ];
  };
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    extraConfig = builtins.readFile ./tmux.conf;
    escapeTime = 10;
    historyLimit = 10000;
    keyMode = "vi";
    terminal = "screen-256color";
    prefix = "C-a";
    plugins = [ catppuccin pkgs.tmuxPlugins.fpp pkgs.tmuxPlugins.tmux-thumbs ];
  };
}
