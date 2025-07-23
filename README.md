# dotfiles

## Mac

- [ ] `sudo scutil --set LocalHostName seol`
  - current supported hostnames are: `seol`
- [ ] `git clone https://github.com/bxnsong/dotfiles.git && cd dotfiles`
- [ ] Install Determinate Nix: `curl -fsSL https://install.determinate.systems/nix | sh -s -- install`
  - say **NO** to the first prompt (asking you to install Determinate)
- [ ] `sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .`

### Git (if we intend on editing)

- [ ] Generate GitHub SSH key
  - `ssh-keygen -t ed25519 -C "<email>"`
- [ ] `git remote set-url git@github.com:bxnsong/dotfiles.git`

### Raycast

- [ ] `open /Applications/Raycast.app` (since we have no cmd+space right now)

### Wallpaper

- [ ] `desktoppr data/wallpapers/3.jpg`

## Linux/WSL (no nix-darwin) (WIP, probably won't work yet)

- [ ] `git clone https://github.com/bxnsong/dotfiles.git && cd dotfiles`
- [ ] Install Determinate Nix: `curl -fsSL https://install.determinate.systems/nix | sh -s -- install`
  - say **NO** to the first prompt (asking you to install Determinate)
- [ ] `hostname seol`
- [ ] `nix run home-manager/master -- init --switch`
- [ ] `home-manager switch --flake .`

## Just (after initial install)

- `just switch`
