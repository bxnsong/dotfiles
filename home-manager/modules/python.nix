{ pkgs, ... }:
let python3 = pkgs.python3.withPackages (p: with p; [ pynvim ipython pipx ]);
in { home = { packages = with pkgs; [ python3 ]; }; }
