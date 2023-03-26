{ pkgs, config, ... }: {
  home = {
    packages = with pkgs; [ tmux ];
    file = {
      ".tmux.conf.local".source =
        config.lib.file.mkOutOfStoreSymlink ./tmux.conf.local;
      ".tmux.conf".source = config.lib.file.mkOutOfStoreSymlink ./tmux.conf;
    };
  };
  programs.tmux.enable = true;
}
