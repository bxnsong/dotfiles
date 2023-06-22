{ config, pkgs, lib, ben, ... }:
let
  inherit (lib) mkOption types;
  inherit (ben) username homeDirectory;
in {
  imports = [
    ./darwin
    ./fzf.nix
    ./git.nix
    ./ideavim
    ./neovim
    ./nnn.nix
    ./packages.nix
    ./python.nix
    ./ranger
    ./starship.nix
    ./tmux
    ./zsh
  ];

  config = {
    home = {
      inherit username homeDirectory;
      stateVersion = "22.11";
    };
    darwinApps = { enable = pkgs.stdenv.hostPlatform.isDarwin; };
    xdg.configFile."fd/ignore".text = ".git";
    programs = { home-manager.enable = true; };
  };
}
