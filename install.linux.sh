#!/usr/bin/env bash

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi

# update nix
nix-channel --update; nix-env -iA nixpkgs.nix nixpkgs.cacert;

# install all programs
nix-env -iA nixpkgs.bat \
    nixpkgs.conda \
    nixpkgs.fasd \
    nixpkgs.fd \
    nixpkgs.fpp \
    nixpkgs.fzf \
    nixpkgs.gh \
    nixpkgs.git \
    nixpkgs.jq \
    nixpkgs.lazygit \
    nixpkgs.lsd \
    nixpkgs.neofetch \
    nixpkgs.neovim \
    nixpkgs.nnn \
    nixpkgs.ripgrep \
    nixpkgs.stow \
    nixpkgs.tldr \
    nixpkgs.tmux \
    nixpkgs.tree \
    nixpkgs.zsh \
    nixpkgs.zsh-autosuggestions
