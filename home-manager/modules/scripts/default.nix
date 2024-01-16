{ pkgs, ... }:
let
  rgf = pkgs.stdenv.mkDerivation {
    name = "rgf";
    src = ./.;
    phases = [ "installPhase" ];
    installPhase = ''
      mkdir -p $out/bin
      cp ${./rgf} $out/bin/rgf
    '';
  };
in { home.packages = [ rgf ]; }
