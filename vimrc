" vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/syntastic'
Plugin 'nanotech/jellybeans.vim'

Plugin 'ctrlpvim/ctrlp.vim'

" languages
Plugin 'davejlong/cf-utils.vim' " CFML
Plugin 'fatih/vim-go' " Go
Plugin 'elixir-lang/vim-elixir' " Elixir

call vundle#end()
filetype plugin indent on

colorscheme jellybeans
let g:jellybeans_use_term_italics=0
let g:jellybeans_use_gui_italics=0

let g:ctrlp_cache_dir='~/.vim/ctrlp/cache'

syntax on
set t_Co=256
set bg=dark

" annoying files
set noswapfile
set nobackup
set nowritebackup

" clean up gvim
" For work Windows stuff
if has("gui_running")
    " accidently pressing the mouse is annoying
    set mouse=c
    " remove surrounding options
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    " pretty font
    set guifont=Lucida_Console:h10
    " NOISES!
    set noerrorbells visualbell
endif

" play nice
set backspace=2
set listchars=tab:?\ ,eol:¬

" line numbers
set number
set relativenumber

" statusline
set laststatus=2
set ruler

" better search
set incsearch
set hlsearch

" follow the leader
let mapleader=","

map <Leader>x :bd<CR>
map <Leader><C-x> :bufdo bd<CR>

" tabs and stuff
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

" specific settings for file types
autocmd FileType python setl ts=4 sw=4 sts=4 cc=80 et
autocmd FileType go setl ts=4 sw=4 sts=4 noet
autocmd FileType elixir setl ts=2 sw=2 sts=2 et
autocmd FileType cfml setl ts=4 sw=4 sts=4 noet
autocmd FileType javascript setl ts=2 sw=2 sts=2 et

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Jump buffer list
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Highlight current position
set cursorline
set cursorcolumn
