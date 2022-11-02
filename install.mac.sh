#!/bin/sh
dotfiles_home="$(pwd)"

# brew installation will also add basic xcode tools (git)
if ! which brew >/dev/null 2>&1; then
	echo "brew not found, installing"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi
brew bundle

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

# fzf
if ! [ -x "$(command -v fzf)" ]; then
	echo "installing fzf"
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install --all
fi

# stow
stow kitty
stow zsh
stow nvim
stow tmux
stow yabai
stow skhd
stow sketchybar
stow rg
stow fd

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
