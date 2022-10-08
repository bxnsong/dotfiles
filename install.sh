dotfiles_home=~/dotfiles


# Neovim
if ! [ -x "$(command -v nvim)" ]
then
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install -y neovim
fi

# LSD
if ! [ -x "$(command -v lsd)" ]
then
    lsd_deb_path=/home/discord/installation/lsd-0.23.1.deb
    sudo dpkg -i $lsd_deb_path
fi

# ripgrep
if ! [ -x "$(command -v rg)" ]
then
    cargo install ripgrep
fi

# fd
if ! [ -x "$(command -v fd)" ]
then
    cargo install fd-find
fi

# copy nvim config
packer_home=~/.local/share/nvim/site/pack/packer/start/packer.nvim
if ! [ -d "$packer_home" ]; then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $packer_home
fi
cp -rsf "$dotfiles_home"/.config/. ~/.config

# fasd
if ! [ -x "$(command -v fasd)" ]; then
    sudo add-apt-repository ppa:aacebedo/fasd
    sudo apt-get update
    sudo apt-get install -y fasd
fi
