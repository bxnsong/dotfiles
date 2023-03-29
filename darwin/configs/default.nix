{ nixpkgs, darwin, home-manager, ... }@inputs:
let
  localLib = import ../../lib { inherit (nixpkgs) lib; };
  inherit (localLib) loadDir;
  inherit (nixpkgs.lib) mapAttrs;
  hosts = loadDir ./.;
  buildConfig = _: cfg:
    let
      inherit (darwin.lib) darwinSystem;
      modules = [ home-manager.darwinModules.home-manager ] ++ cfg.modules;
    in darwinSystem (cfg // { inherit modules; });
in mapAttrs buildConfig hosts
