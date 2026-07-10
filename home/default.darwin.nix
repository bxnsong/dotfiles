{ pkgs, inputs, ... }:
{
  home.packages =
    with pkgs;
    [
      discord
      jq
      nodejs_26
      raycast
    ]
    ++ [
      inputs.codex-cli-nix.packages.${pkgs.system}.default
    ];
}
