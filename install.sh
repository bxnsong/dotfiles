# Neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim

# LSD
LSD_DEB_PATH=/home/discord/installation/lsd-0.23.1.deb
sudo dpkg -i $LSD_DEB_PATH

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
