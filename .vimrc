filetype off

" Vundle config
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

filetype plugin indent on

syntax on

set t_Co=256
set incsearch
set number relativenumber
set nocompatible
set history=200
set shiftwidth=2
set backspace=2
set laststatus=2
set tabstop=2
set expandtab

set cursorline
set cursorcolumn
set ruler

syntax enable
set background=dark
let g:solarized_termtrans = 1
try
  colorscheme solarized
  catch
endtry

let mapleader = "\<Space>"

nmap <leader>so :source $MYVIMRC<cr>
imap jk <esc>
imap kj <esc>
