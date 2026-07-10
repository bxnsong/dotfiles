{ pkgs, inputs, ... }:
{
  home.packages =
    with pkgs;
    [
      discord
      jq
      (pnpm.override { nodejs = nodejs_26; })
      nodejs_26
      raycast
    ]
    ++ [
      inputs.codex-cli-nix.packages.${pkgs.system}.default
    ];
}
