{ config, pkgs, ... }:
let
  download-song = import ./scripts/download-song.nix {
    inherit pkgs;
    destination = "${config.home.homeDirectory}/OneDrive/Documents/Music/Samples/References";
  };
in
{
  home.packages = with pkgs; [
    download-song
    yt-dlp
  ];

  programs.go.enable = true;
}
