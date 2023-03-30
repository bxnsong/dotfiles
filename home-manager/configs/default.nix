{ nixpkgs, home-manager, ... }@inputs:
let
  localLib = import ../../lib { inherit (nixpkgs) lib; };
  inherit (builtins) mapAttrs;
  inherit (localLib) loadDir;
  hosts = loadDir ./.;
in mapAttrs (_: host:
  (let
    inherit (host) system;
    pkgs = import nixpkgs { inherit (host) system; };
  in home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecialArgs = inputs // {
      ben.username = host.config.ben.username;
      ben.homeDirectory = host.config.ben.homeDirectory;
    };
    modules = [ ../modules/default.nix ];
  })) hosts
