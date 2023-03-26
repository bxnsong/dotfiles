{ self, pkgs, ... }:
let
  python3 = pkgs.python3.withPackages
    (p: with p; [ flake8 requests python-lsp-server pynvim ipython ]);
  packages = with pkgs; [
    bat
    black
    fasd
    fd
    fpp
    gh
    jq
    ktlint
    lazygit
    lsd
    luarocks
    neofetch
    nixfmt
    python3
    ranger
    ripgrep
    rnix-lsp
    starship
    stow
    stylua
    tldr
    tmux
    tree
    zsh
  ];
in { home = { inherit packages; }; }
