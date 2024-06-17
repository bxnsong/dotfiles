{ self, pkgs, ben, ... }:
let
  nonWorkPackages = if !ben.work then with pkgs; [ jq yarn nodejs corepack_22 ] else [ ];
  packages = with pkgs;
    [
      black
      cmake
      eza
      fasd
      fd
      fpp
      gh
      httpie
      luajit
      luarocks
      ncurses
      neofetch
      nix-prefetch-github
      nixfmt
      ripgrep
      stow
      tldr
      unzip
    ] ++ nonWorkPackages;
in { home = { inherit packages; }; }
