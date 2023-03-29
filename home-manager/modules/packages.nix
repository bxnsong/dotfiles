{ self, pkgs, ... }:
let
  packages = with pkgs; [
    bat
    black
    fasd
    fd
    fpp
    gh
    jq
    ktlint
    lazygit
    lsd
    luarocks
    ncurses
    neofetch
    nixfmt
    ripgrep
    rnix-lsp
    stow
    stylua
    tldr
    tree
    yarn
  ];
in { home = { inherit packages; }; }
