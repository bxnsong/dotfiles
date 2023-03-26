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
