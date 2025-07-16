{ pkgs, ... }:
let
  shellAliases = {
    v = "nvim";
    vim = "nvim";
    ls = "eza --icons=always";
    lg = "lazygit";
    cat = "bat";
    nnn = "nnn -APp";
    mux = "tmuxinator";
  };
in
{
  home.packages = with pkgs; [ zsh ];
  programs = {
    fzf.enableZshIntegration = true;

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
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
        PATH = "\${PATH}";
      };

      initContent = (builtins.readFile ./zshrc);
    };
  };
}
