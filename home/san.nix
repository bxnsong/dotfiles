{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  home.username = "ben";
  home.homeDirectory = "/home/ben";
  home.packages = with pkgs; [ claude-code ngrok nodePackages.nodejs yt-dlp ];
}
