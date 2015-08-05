"vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'

" language specific
Plugin 'rust-lang/rust.vim'
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

" play nice
set backspace=2
set listchars=tab:▸\ ,eol:¬

" line numbers
set number
set relativenumber

" statusline
set laststatus=2
set ruler

" better search
set incsearch
set hlsearch

" tabs and stuff
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

" specific settings for file types
autocmd FileType python setl ts=4 sw=4 sts=4 cc=80 et
autocmd FileType go setl ts=4 sw=4 sts=4 noet

" colours
set cursorline

syntax on
set t_Co=256
set background=dark
colorscheme solarized
