{ config, lib, pkgs, ... }: {
  programs = {
    nnn = {
      enable = true;
      package = pkgs.nnn.override ({ withNerdIcons = true; });
      extraPackages = with pkgs; [ bat fzf exa ];
      plugins = {
        src = "${pkgs.nnn.src}/plugins";
        mappings = {
          p = "preview-tui";
          v = "imgview";
          o = "fzopen";
        };
      };
    };
    zsh.sessionVariables = { NNN_FIFO = "$XDG_RUNTIME_DIR/nnn.fifo"; };
  };
}
