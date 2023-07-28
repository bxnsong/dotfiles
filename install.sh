#!/bin/bash

DOTFILES_DIR=${DOTFILES_DIR:-$HOME/dotfiles}

RUN_NIX_INSTALL=${RUN_NIX_INSTALL:-false} # Setup and install packages using Nix
HOME_MANAGER_PROFILE=${HOME_MANAGER_PROFILE:-sejeong}


if [[ ! -z $CUSTOM_HOSTNAME ]]; then
    sudo hostname $CUSTOM_HOSTNAME
fi


if [ "$RUN_NIX_INSTALL" = true ]; then
    NIX_BIN=$HOME/.nix-profile/bin
    if [[ ! -d "$HOME/.nix-profile" ]]; then
        curl -L https://nixos.org/nix/install | sh
    fi

    . $HOME/.nix-profile/etc/profile.d/nix.sh

    # Install Home Manager
    $NIX_BIN/nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    $NIX_BIN/nix-channel --update
    $NIX_BIN/nix-shell '<home-manager>' -A install

    # Enable Flakes
    mkdir -p $HOME/.config/nix && echo "experimental-features = nix-command flakes" > $HOME/.config/nix/nix.conf

    $NIX_BIN/home-manager switch --flake "$DOTFILES_DIR#$HOME_MANAGER_PROFILE"
fi
