#!/bin/bash

# set the working directory to where the file is
cd "$(dirname "$0")" || return

case $(uname -s) in
Darwin) OS=darwin ;;
Linux) OS=linux ;;
*) echo "Unsupport OS $(uname -s)"; exit 1 ;;
esac

case $OS in
darwin) ./install.mac.sh ;;
linux) ./install.linux.sh ;;
esac

# oh-my-zsh
if ! [ -d ~/.oh-my-zsh ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
	rm ~/.zshrc
	chsh -s $(which zsh)
fi

source stow.sh
