{ pkgs, config, ... }: {
  home = {
    packages = with pkgs; [ tmux ];
    file = {
      ".tmux.conf.local".source =
        config.lib.file.mkOutOfStoreSymlink ./config/tmux.conf.local;
      ".tmux.conf".source =
        config.lib.file.mkOutOfStoreSymlink ./config/tmux.conf;
    };
  };
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    extraConfig = builtins.readFile ./config/tmux.conf;
    historyLimit = 10000;
    keyMode = "vi";
    terminal = "xterm-256color";
  };
}
