{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pnpm
    qmk
    yt-dlp
  ];

  programs.go.enable = true;
}
