{ self, pkgs, ben, ... }:
let
  nonWorkPackages = if !ben.work then with pkgs; [ jq yarn ] else [ ];
  packages = with pkgs;
    [
      black
      cmake
      fasd
      fd
      fpp
      gh
      lsd
      luajit
      luarocks
      ncurses
      neofetch
      nix-prefetch-github
      nixfmt
      nodejs
      ripgrep
      stow
      tldr
      tree
    ] ++ nonWorkPackages;
in { home = { inherit packages; }; }
