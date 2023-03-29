{
  description = "Home Manager flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs@{ darwin, home-manager, nixpkgs, ... }: {
    homeConfigurations = import ./home-manager/configs inputs;
    darwinConfigurations = import ./darwin/configs inputs;
  };
}
