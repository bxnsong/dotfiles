{
  description = "Home Manager flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    homebrew-core = {
      url = "github:Homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:Homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:Homebrew/homebrew-bundle";
      flake = false;
    };
    aerospace-tap = {
      url = "github:nikitabobko/homebrew-tap";
      flake = false;
    };
    sketchybar-tap = {
      url = "github:FelixKratz/homebrew-formulae";
      flake = false;
    };
  };
  outputs = { self, ... }@inputs:
    let
      inherit (self) outputs;
      libx = import ./lib { inherit inputs outputs; };
    in {
      homeConfigurations = {
        ben = libx.mkLinux {
          hostname = "san";
          username = "ben";
        };
      };
      darwinConfigurations = {
        rumi = libx.mkDarwin {
          hostname = "rumi";
          username = "ben";
        };
        seol = libx.mkDarwin {
          hostname = "seol";
          username = "ben";
        };
      };
    };
}
