# dotfiles

## Mac

- [ ] `sudo scutil --set LocalHostName seol`
  - current supported hostnames are: `seol`
- [ ] `git clone https://github.com/bxnsong/dotfiles.git && cd dotfiles`
- [ ] Install Determinate Nix: `curl -fsSL https://install.determinate.systems/nix | sh -s -- install`
  - say **NO** to the first prompt (asking you to install Determinate)
- [ ] `sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .`

### Raycast

- [ ] Might need to run `just switch` after initial install to set up Raycast keybindings
- [ ] `open /Users/ben/Applications/Home\ Manager\ Apps/Raycast.app` (since we have no cmd+space right now)

### Wallpaper

- [ ] `desktoppr data/wallpapers/3.jpg`

## WSL

- [ ] `git clone https://github.com/bxnsong/dotfiles.git && cd dotfiles`
- [ ] Install Determinate Nix: `curl -fsSL https://install.determinate.systems/nix | sh -s -- install`
  - say **NO** to the first prompt (asking you to install Determinate)
- [ ] `nix run home-manager/master -- switch --flake .#ben`
- [ ] might need to change shell to zsh in /etc/shells

## Just (after initial install)

- `just switch`

## SSH key for Git (if we intend on editing)

- [ ] Generate GitHub SSH key
  - `ssh-keygen -t ed25519 -C "<email>"`
- [ ] `git remote set-url origin git@github.com:bxnsong/dotfiles.git`