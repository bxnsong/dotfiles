{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    codex
    ffmpeg-full
    ngrok
    nodejs_22
    pnpm
    yt-dlp
  ];
}
