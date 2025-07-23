# dotfiles

## Mac
- [ ] Set hostname in Settings > About
  - current supported hostnames are: `seol`
- [ ] `git clone https://github.com/bxnsong/dotfiles.git && cd dotfiles`
- [ ] Install Determinate Nix: `curl -fsSL https://install.determinate.systems/nix | sh -s -- install`
  - say **NO** to the first prompt (asking you to install Determinate)
- [ ] `sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .`
- [ ] (optional) `defaults write -g InitialKeyRepeat -int 10`
- [ ] (optional) `defaults write -g KeyRepeat -int 1`
- [ ] Log out and back in

### Git
- [ ] Generate GitHub SSH key
  - `ssh-keygen -t ed25519 -C "<email>"`
- [ ] `git remote set-url git@github.com:bxnsong/dotfiles.git`

### Raycast
- [ ] System Settings > Keyboard > Keyboard Shortcuts > Spotlight (OFF)
- [ ] System Settings > Keyboard > Shortcuts > App Shortcuts
  - Click the [+] button and in the sheet that appears...
  - Set Application: to: All Applications
  - Set Menu Title: to: Emoji & Symbols
  - Set Keyboard Shortcut to e.g.: ⌃⇧⌘Space

## Windows (no nix-darwin)
- [ ] `nix run home-manager/master -- init --switch`
- [ ] `home-manager switch --flake .`

