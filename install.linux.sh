if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi

# install all programs
nix-env -iA nixpkgs.bat \
    nixpkgs.fasd \
    nixpkgs.fd \
    nixpkgs.fpp \
    nixpkgs.fzf \
    nixpkgs.gh \
    nixpkgs.git \
    nixpkgs.jq \
    nixpkgs.lsd \
    nixpkgs.neofetch \
    nixpkgs.neovim \
    nixpkgs.nnn \
    nixpkgs.ripgrep \
    nixpkgs.stow \
    nixpkgs.tmux \
    nixpkgs.tree \
    nixpkgs.zsh
