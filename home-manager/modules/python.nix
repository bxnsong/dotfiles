{ pkgs, ben, ... }:
let python3 = pkgs.python311.withPackages (p: with p; [ pynvim ipython pipx ]);
in { home = { packages = with pkgs; if !ben.work then [ python3 ] else [ ]; }; }
