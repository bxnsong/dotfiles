#!/bin/sh

# brew installation will also add basic xcode tools (git)
if ! which brew >/dev/null 2>&1; then
	echo "brew not found, installing"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi
brew update && brew upgrade && brew bundle

#### APPLE DEFAULTS ####

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

echo "-- add PATH=\"\" to /etc/zprofile"
echo "-- set caps lock to ctrl"
