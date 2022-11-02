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

# oh-my-tmux
tmux_home=~/.tmux
tmux_conf=~/.tmux.conf
if ! [ -f "$tmux_conf" ]; then
	echo "installing oh-my-tmux"
	git clone https://github.com/gpakosz/.tmux.git $tmux_home
	cp -sf "$tmux_home"/.tmux.conf $tmux_conf
fi

source stow.sh
