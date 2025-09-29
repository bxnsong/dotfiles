{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [ claude-code ngrok nodePackages.nodejs yt-dlp ];
}
