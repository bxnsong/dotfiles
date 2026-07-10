{ pkgs, ... }:
{
  home.packages = with pkgs; [
    yt-dlp
  ];

  programs.go.enable = true;
}
