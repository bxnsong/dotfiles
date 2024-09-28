{ self, pkgs, ben, ... }:
let
  nonWorkPackages = if !ben.work then with pkgs; [ jq yarn nodejs corepack_22 texliveFull ] else [ ];
  packages = with pkgs;
    [
      black
      cmake
      eza
      fd
      fpp
      gh
      httpie
      luajit
      luarocks
      ncurses
      neofetch
      nix-prefetch-github
      nixfmt-classic
      ripgrep
      rustup
      stow
      tldr
      unzip
      zoxide
    ] ++ nonWorkPackages;
in { home = { inherit packages; }; }
