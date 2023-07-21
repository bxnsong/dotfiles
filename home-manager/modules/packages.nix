{ self, pkgs, ben, ... }:
let
  nonWorkPackages = if !ben.work then with pkgs; [ jq yarn nodejs ] else [ ];
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
      ripgrep
      stow
      tldr
      tree
    ] ++ nonWorkPackages;
in { home = { inherit packages; }; }
