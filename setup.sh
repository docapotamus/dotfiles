#/bin/sh

cp ./tmux.conf ~/.tmux.conf
cp ./gitconfig ~/.gitconfig

# Vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ./vimrc ~/.vimrc
