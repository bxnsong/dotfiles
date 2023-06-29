{ config, pkgs, lib, ben, ... }:
let
  inherit (lib) mkOption types;
  inherit (ben) username homeDirectory;
in {
  imports = [
    ./darwin
    ./fzf.nix
    ./git
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
    programs = {
      home-manager.enable = true;
      bat = {
        enable = true;
        config = { theme = "mocha"; };
        themes = {
          mocha = builtins.readFile (pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "bat";
            rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
            sha256 = "6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
          } + "/Catppuccin-mocha.tmTheme");
        };
      };
    };
  };
}
