{ nixpkgs, neovim-nightly-overlay, home-manager, ... }@inputs:
let
  localLib = import ../../lib { inherit (nixpkgs) lib; };
  inherit (builtins) mapAttrs;
  inherit (localLib) loadDir;
  hosts = loadDir ./.;
in mapAttrs (_: host:
  (let
    inherit (host) system;
    pkgs = import nixpkgs {
      inherit (host) system;
      overlays = [ neovim-nightly-overlay.overlay ];
    };
  in home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecialArgs = inputs // { inherit (host.config) ben; };
    modules = [ ../modules/default.nix ];
  })) hosts
