{ pkgs, nixpkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  home.username = "ben";
  home.homeDirectory = "/home/ben";
  home.packages = with pkgs; [
    claude-code
    corepack
    gcc
    nodePackages.nodejs
    rustup
  ];
}
