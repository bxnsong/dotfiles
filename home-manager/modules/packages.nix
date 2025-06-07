{ pkgs, ben, ... }:
let
  nonWorkPackages = if !ben.work then
    with pkgs; [ rustup jq yarn nodejs_22 corepack_22 texliveFull ]
  else
    [ ];
  packages = with pkgs;
    [
      chafa
      eza
      fd
      ffmpeg-full
      httpie
      neofetch
      nixfmt-classic
      ripgrep
      tldr
      unzip
      uv
      zoxide
    ] ++ nonWorkPackages;
in { home = { inherit packages; }; }
