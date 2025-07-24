{ pkgs, ... }: {
  home.packages = with pkgs; [
    claude-code
    corepack
    jq
    nodePackages.nodejs
    rustup
  ];
}

