{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "sketchybar-config";
  src = ./config;
  installPhase = ''
    mkdir -p $out
    cp -r * $out/
    find $out -name "*.sh" -type f -exec chmod +x {} \;
    [ -f $out/sketchybarrc ] && chmod +x $out/sketchybarrc
  '';
}
