filetype off

" Vundle config
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

filetype plugin indent on

syntax enable
syntax on
set t_Co=256
set noswapfile
set incsearch
set relativenumber
set number
set nocompatible
set history=50
set shiftwidth=2
set backspace=2
set laststatus=2
set tabstop=2
set expandtab
set cursorline
set cursorcolumn
set colorcolumn=80
set ruler
set background=dark

try
  colorscheme solarized
  catch
endtry

let g:solarized_termcolors=256
let g:solarized_visibility  = "high"
let g:solarized_contrast    = "high"
let mapleader = "\<Space>"

nmap <leader>so :source $MYVIMRC<cr>
imap jk <esc>
imap kj <esc>
