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
        plugins = [ "gitfast" ];
        theme = "clean";
      };
      inherit shellAliases;
      sessionVariables = {
        EDITOR = "nvim";
        GIT_EDITOR = "nvim";
      };

      initExtra = (builtins.readFile ./zshrc);
    };
  };
}
