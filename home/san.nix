{ pkgs, inputs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  home.packages =
    with pkgs;
    [
      ffmpeg-full
      ngrok
      nodejs_22
      pnpm
      yt-dlp
    ]
    ++ [
      inputs.codex-cli-nix.packages.${pkgs.system}.default
    ];
}
