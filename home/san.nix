{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    codex
    ffmpeg-full
    ngrok
    nodePackages.nodejs
    yt-dlp
  ];
}
