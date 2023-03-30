{ self, pkgs, ... }:
let
  packages = with pkgs; [
    bat
    black
    cargo
    cmake
    fasd
    fd
    fpp
    gh
    jq
    lazygit
    lsd
    luarocks
    ncurses
    neofetch
    nixfmt
    ripgrep
    stow
    tldr
    tree
    yarn
  ];
in { home = { inherit packages; }; }
