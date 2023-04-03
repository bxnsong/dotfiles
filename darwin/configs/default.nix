{ nixpkgs, darwin, home-manager, neovim-nightly-overlay, ... }@inputs:
let
  localLib = import ../../lib { inherit (nixpkgs) lib; };
  inherit (localLib) loadDir;
  inherit (nixpkgs.lib) mapAttrs;
  hosts = loadDir ./.;
  overlays = [ neovim-nightly-overlay.overlay ];
  buildConfig = _: cfg:
    let
      inherit (darwin.lib) darwinSystem;
      modules = [
        { nixpkgs.overlays = overlays; }
        home-manager.darwinModules.home-manager
      ] ++ cfg.modules;
    in darwinSystem (cfg // { inherit modules; });
in mapAttrs buildConfig hosts
