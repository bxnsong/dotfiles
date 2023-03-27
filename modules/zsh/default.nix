{ pkgs, ... }:
let
  shellAliases = {
    v = "nvim";
    vim = "nvim";
    ls = "lsd";
    lg = "lazygit";
  };
in {
  home.packages = with pkgs; [ zsh ];
  programs = {
    fzf.enableZshIntegration = true;

    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      dotDir = ".config/zsh";
      oh-my-zsh = {
        enable = true;
        plugins = [ "gitfast" "tmux" ];
        theme = "clean";
      };
      inherit shellAliases;
      sessionVariables = {
        EDITOR = "nvim";
        GIT_EDITOR = "nvim";
        ZSH_TMUX_AUTOSTART = "false";

        PATH = "\${PATH}";
      };

      initExtra = (builtins.readFile ./zshrc);
    };
  };
}
