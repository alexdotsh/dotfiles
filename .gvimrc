set background=light
set guifont=Monaco:h16
set t_Co=256
set noswapfile
set ruler
set incsearch
set number
set relativenumber
set nocompatible
set history=50
set shiftwidth=2
set backspace=2
set laststatus=2
set tabstop=2
set expandtab
set cursorline
set cursorcolumn

colorscheme solarized
let g:solarized_termcolors=256
let mapleader = "\<Space>"
nmap <leader>so :source $MYVIMRC<cr>
imap jk <esc>
imap kj <esc>

syntax enable
syntax on

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-rails'
Plugin 'elzr/vim-json'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
call vundle#end()
filetype plugin indent on