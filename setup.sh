#/bin/sh

cp ./tmux.conf ~/.tmux.conf
cp ./gitconfig ~/.gitconfig

# Vim
if [ ! -d ~/.vim/bundle/Vundle.vim ] ; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
cp ./vimrc ~/.vimrc
