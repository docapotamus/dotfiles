#/bin/sh

if [ ! -d ~/.tmux/plugins/tpm ] ; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmxu/plugins/tpm
fi

cp ./tmux.conf ~/.tmux.conf
cp ./gitconfig ~/.gitconfig

# Neovim
mkdir -p ~/.config/nvim
cp ./nvim/* ~/.config/nvim/
