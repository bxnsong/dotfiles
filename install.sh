# Neovim
if ! command -v nvim &> /dev/null
then
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install -y neovim
fi

# LSD
if ! command -v lsd &> /dev/null
then
    LSD_DEB_PATH=/home/discord/installation/lsd-0.23.1.deb
    sudo dpkg -i $LSD_DEB_PATH
fi

# ripgrep
if ! command -v rg &> /dev/null
then
    cargo install ripgrep
fi

# fd
if ! command -v fd &> /dev/null
then
    cargo install fd-find
fi
