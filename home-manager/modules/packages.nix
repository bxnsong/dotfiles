{ self, pkgs, ... }:
let
  packages = with pkgs; [
    bat
    black
    fasd
    fd
    fpp
    gh
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
  ];
in { home = { inherit packages; }; }
