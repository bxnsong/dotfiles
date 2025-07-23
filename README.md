# dotfiles

`sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .`

- [ ] Set hostname in Settings > About
  - current supported hostnames are: `seol`
- [ ] Generate GitHub SSH key
  - `ssh-keygen -t ed25519 -C "<email>"`
- [ ] `git clone git@github.com:bxnsong/dotfiles.git`
- [ ] System Settings > Keyboard > Keyboard Shortcuts > Spotlight (OFF)
- [ ] System Settings > Keyboard > Shortcuts > App Shortcuts
  - Click the [+] button and in the sheet that appears...
  - Set Application: to: All Applications
  - Set Menu Title: to: Emoji & Symbols
  - Set Keyboard Shortcut to e.g.: ⌃⇧⌘Space
- [ ] Install Determinate Nix: `curl -fsSL https://install.determinate.systems/nix | sh -s -- install`
  - say **NO** to the first prompt (installing Determinate)
- [ ] `nix run home-manager/master -- init --switch`
- [ ] `sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .`
- [ ] `home-manager switch --flake .`
- [ ] (optional) `defaults write -g InitialKeyRepeat -int 10`
- [ ] (optional) `defaults write -g KeyRepeat -int 1`
- [ ] Restart Mac

