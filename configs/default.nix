{ nixpkgs, home-manager, ... }@inputs:
let
  localLib = import ../lib { inherit (nixpkgs) lib; };
  inherit (builtins) mapAttrs;
  inherit (localLib) loadDir;
  hosts = loadDir ./.;
in mapAttrs (_: host:
  (let
    inherit (host) system config;
    pkgs = import nixpkgs { inherit (host) system; };
    username = config.ben.username;
    homeDirectory = config.ben.homeDirectory;
  in home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecialArgs = inputs;
    modules = [ ../modules/default.nix ];
  })) hosts
