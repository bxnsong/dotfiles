dotfiles_home=~/dotfiles


# Neovim
if ! [ -x "$(command -v nvim)" ]
then
    echo "neovim not found, installing"
    sudo add-apt-repository --yes ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install -y neovim
fi

# LSD
if ! [ -x "$(command -v lsd)" ]
then
    echo "lsd not found, installing"
    lsd_deb_path=/home/discord/installation/lsd-0.23.1.deb
    sudo dpkg -i $lsd_deb_path
fi

# ripgrep
if ! [ -x "$(command -v rg)" ]
then
    echo "rg not found, installing"
    cargo install ripgrep
fi

# fd
if ! [ -x "$(command -v fd)" ]
then
    echo "fd not found, installing"
    cargo install fd-find
fi

# copy dotfiles
zshrc=~/.zshrc
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
    cp -rsf "$tmux_home"/.tmux.conf $tmux_conf
fi

tmux_conf_local=~/.tmux.conf.local
if ! [ -f "$tmux_conf_local" ]; then
    echo "symlinking .tmux.conf.local"
    cp -rsf "$dotfiles_home"/.tmux.conf.local ~/.tmux.conf.local
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
    sudo add-apt-repository --yes ppa:aacebedo/fasd
    sudo apt-get update
    sudo apt-get install -y fasd
fi

# lazygit
if ! [ -x "$(command -v lazygit)" ]; then
    echo "lazygit not found, installing"
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
    rm lazygit.tar.gz
fi

# TODO: install fpp
