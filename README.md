# dotfiles

experimental dotfiles using Home Manager

install Nix: `sh <(curl -L https://nixos.org/nix/install) --daemon`

enable Nix flakes: `mkdir -p $HOME/.config/nix && echo "experimental-features = nix-command flakes" > $HOME/.config/nix/nix.conf`

install Home Manager: `https://nix-community.github.io/home-manager/index.html#sec-install-standalone`

install dotfiles: `git clone git@github.com:bxnsong/nix.dotfiles.git && cd nix.dotfiles && home-manager switch --flake .`
