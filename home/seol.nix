{ config, inputs, pkgs, lib, ... }: {
  home.packages = with pkgs; [
    claude-code
    corepack
    jq
    nodePackages.nodejs
    rustup
  ];
}

