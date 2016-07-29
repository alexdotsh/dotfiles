syntax  enable
set background=light
colorscheme solarized
let g:solarized_termcolo=256
set guifont=Monaco:h16
set t_Co=256
set backspace=2
set noswapfile
set ruler
set history=50
set incsearch
set laststatus=2
set number
set tabstop=2
let mapleader = "\<Space>"
nmap <leader>so :source $MYVIMRC<cr>
imap jk <esc>
imap kj <esc>
set nocompatible
syntax on
set shiftwidth=2
set tabstop=2
set expandtab

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
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'elzr/vim-json'
Plugin 'majutsushi/tagbar'
call vundle#end()
filetype plugin indent on 

