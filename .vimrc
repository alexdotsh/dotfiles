filetype off
filetype plugin indent on

set t_Co=256
set incsearch
set number
set nocompatible
set history=10000
set shiftwidth=2
set backspace=2
set laststatus=2
set tabstop=2
set expandtab
set cursorline
set ruler

let mapleader = "\<Space>"

nmap <leader>so :source $MYVIMRC<cr>
imap jk <esc>
imap kj <esc>
