{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [ codex ngrok nodePackages.nodejs yt-dlp ];
}
