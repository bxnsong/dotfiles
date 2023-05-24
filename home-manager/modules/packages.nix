{ self, pkgs, ... }:
let
  packages = with pkgs; [
    bat
    black
    cmake
    fasd
    fd
    fpp
    gh
    jq
    lazygit
    lsd
    luajit
    luarocks
    ncurses
    neofetch
    nixfmt
    nodejs
    ripgrep
    stow
    tldr
    tree
    yarn
  ];
in { home = { inherit packages; }; }
