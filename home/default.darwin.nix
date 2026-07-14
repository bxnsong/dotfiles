{ pkgs, inputs, ... }:
{
  home.packages =
    with pkgs;
    [
      btop
      discord
      jq
      macmon
      (pnpm.override { nodejs = nodejs-slim_26; })
      nodejs-slim_26
      raycast
    ]
    ++ [
      inputs.codex-cli-nix.packages.${pkgs.system}.default
    ];
}
