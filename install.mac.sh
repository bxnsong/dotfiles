#!/bin/sh
dotfiles_home=~/dotfiles

# brew installation will also add basic xcode tools (git)
if ! which brew >/dev/null 2>&1; then
  echo "brew not found, installing"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# fonts
# brew tap homebrew/cask-fonts
# brew install --cask font-fira-code
# brew install --cask font-fira-code-nerd-font
# brew install --cask font-hack
# brew install --cask font-hack-nerd-font

# neovim
if ! [ -x "$(command -v nvim)" ]; then
    echo "neovim not found, installing"
    brew install --HEAD neovim
fi

# neovim
if ! [ -x "$(command -v jq)" ]; then
    echo "jq not found, installing"
    brew install jq
fi

# LSD
if ! [ -x "$(command -v lsd)" ]; then
    echo "lsd not found, installing"
    brew install lsd
fi

# ripgrep
if ! [ -x "$(command -v rg)" ]; then
    echo "rg not found, installing"
    brew install ripgrep
fi

# fd
if ! [ -x "$(command -v fd)" ]; then
    echo "fd not found, installing"
    brew install fd
fi

# copy dotfiles
if ! [ -f "$zshrc" ]; then
    echo "symlinking .zshrc"
    cp -rsf "$dotfiles_home"/.zshrc ~/.zshrc
fi

# oh-my-zsh
if [[ ! -d ~/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  chsh -s $(which zsh)
fi

tmux_home=~/.tmux
tmux_conf=~/.tmux.conf
if ! [ -f "$tmux_conf" ]; then
    echo "installing oh-my-tmux"
    git clone https://github.com/gpakosz/.tmux.git $tmux_home
    cp -sf "$tmux_home"/.tmux.conf $tmux_conf
fi

tmux_conf_local=~/.tmux.conf.local
if ! [ -f "$tmux_conf_local" ]; then
    echo "symlinking .tmux.conf.local"
    cp -sf "$dotfiles_home"/.tmux.conf.local ~/.tmux.conf.local
fi

yabairc=~/.yabairc
if ! [ -f "$yabairc" ]; then
    echo "symlinking .yabairc"
    cp -sf "$dotfiles_home"/.yabairc $yabairc
fi

skhdrc=~/.skhdrc
if ! [ -f "$skhdrc" ]; then
    echo "symlinking .skhdrc"
    cp -sf "$dotfiles_home"/.skhdrc $skhdrc
fi

echo "symlinking .config"
cp -rsf "$dotfiles_home"/.config/. ~/.config

# install nvim package manager
packer_home=~/.local/share/nvim/site/pack/packer/start/packer.nvim
if ! [ -d "$packer_home" ]; then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $packer_home
fi

# fasd
if ! [ -x "$(command -v fasd)" ]; then
    echo "fasd not found, installing"
    brew install fasd
fi

# lazygit
if ! [ -x "$(command -v lazygit)" ]; then
    echo "lazygit not found, installing"
    brew install jesseduffield/lazygit/lazygit
fi

# fpp
if ! [ -x "$(command -v fpp)" ]; then
    echo "fpp not found, installing"
    brew install fpp
fi

# fzf
if ! [ -x "$(command -v fzf)" ]; then
    echo "fzf not found, installing"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
fi

# gh
if ! [ -x "$(command -v gh)" ]; then
    echo "gh not found, installing"
    brew install gh
fi

# bat
if ! [ -x "$(command -v bat)" ]; then
    echo "bat not found, installing"
    brew install bat
fi

# save screenshots as .png
defaults write com.apple.screencapture type -string "png"

# set screenshot location to ~/Pictures/screenshots
mkdir -p ~/Pictures/screenshots
screenshot_location=~/Pictures/screenshots/
defaults write com.apple.screencapture location -string "${screenshot_location}"

# show file extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# enable keyboard for UI elements (e.g. tab works for modal dialogs, menu windows)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# make keyboard repeat rate fast
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 15

# auto-hide dock
defaults write com.apple.dock autohide -bool true

# unshow recents in dock
defaults write com.apple.dock show-recents -bool FALSE

# hide the menu bar
defaults write "Apple Global Domain" "_HIHideMenuBar" 1
