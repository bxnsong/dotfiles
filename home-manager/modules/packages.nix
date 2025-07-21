{ pkgs, ben, ... }:
let
  nonWorkPackages = if !ben.work then
    with pkgs; [
      claude-code
      nodePackages.nodejs
      corepack
      rustup
      jq
      texliveFull
    ]
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
