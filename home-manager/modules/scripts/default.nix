{ pkgs, ... }:
let
  scripts = [{
    name = "rgf";
    description = "rg + fzf picker";
    filename = ./rgf;
  }];

  derivations = builtins.map (script:
    pkgs.stdenv.mkDerivation {
      name = script.name;
      src = ./.;
      phases = [ "installPhase" ];
      installPhase = ''
        mkdir -p $out/bin
        cp ${script.filename} $out/bin/${script.name}
      '';
    }) scripts;

  pickerEntries = builtins.concatStringsSep "\n"
    (builtins.sort builtins.lessThan
      (builtins.map (script: "${script.name}|${script.description}") scripts));

  picker = pkgs.writeScriptBin "picker" "echo '${pickerEntries}'";

  pickerAlias =
    ''print -rz -- "$(${picker}/bin/picker | fzf | cut -d\| -f1) "'';
in {
  home.packages = derivations;
  programs.zsh.shellAliases = { p = pickerAlias; };
}
