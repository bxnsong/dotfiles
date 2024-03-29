{ config, lib, pkgs, ... }: {
  programs = {
    nnn = {
      enable = true;
      package = pkgs.nnn.override ({ withNerdIcons = true; });
      extraPackages = with pkgs; [ bat fzf ];
      plugins = {
        src = "${pkgs.nnn.src}/plugins";
        mappings = {
          p = "preview-tui";
          o = "fzopen";
        };
      };
    };
    zsh.sessionVariables = {
      NNN_FIFO = "$HOME/.config/nnn/nnn.fifo";
      NNN_BATSTYLE = "plain";
    };
  };
}
