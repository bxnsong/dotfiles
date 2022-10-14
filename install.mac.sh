#!/bin/sh
dotfiles_home=~/dotfiles

# neovim
if ! [ -x "$(command -v nvim)" ]; then
    echo "neovim not found, installing"
    brew install --HEAD neovim
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

oh_my_zsh=~/.oh-my-zsh
if ! [ -d "$oh_my_zsh" ]; then
    echo "oh-my-zsh not installed, run sh -c \"\$\(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh\)\""
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

# # prettier
# if ! [ -x "$(command -v prettier)" ]; then
#     echo "prettier not found, installing"
#     npm i prettier -g
# fi
#
# # prettierd
# if ! [ -x "$(command -v prettierd)" ]; then
#     echo "prettierd not found, installing"
#     npm i @fsouza/prettierd -g
# fi

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
