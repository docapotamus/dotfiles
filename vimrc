" vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'w0rp/ale'
Plugin 'morhetz/gruvbox'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'mattn/emmet-vim'

" languages
Plugin 'pangloss/vim-javascript' " Javascript
Plugin 'posva/vim-vue' " VueJS
Plugin 'fatih/vim-go' " Go
Plugin 'rust-lang/rust.vim' " Rust
Plugin 'digitaltoad/vim-pug.git' " Pug
Plugin 'elmcast/elm-vim' " Elm

call vundle#end()
filetype plugin indent on

colorscheme gruvbox
let g:jellybeans_use_term_italics=0
let g:jellybeans_use_gui_italics=0

let g:ctrlp_cache_dir='~/.vim/ctrlp/cache'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|node_modules/|venv/)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'

syntax on
set t_Co=256
set bg=dark

set clipboard=unnamed

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

" buffer move bindings
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

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
autocmd FileType javascript setl ts=4 sw=4 sts=4 cc=100 et
autocmd FileType elm setl ts=4 sw=4 sts=4 cc=80 et
autocmd FileType yaml setl ts=2 sw=2 sts=2 et
autocmd FileType tf setl ts=2 sw=2 sts=2 et

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
