#!/usr/bin/env bash

echo -e "Start bootstrapping.. \U1F3C1"

if [[ ! -d "${HOME}/.source" ]]; then
  git clone --recursive https://github.com/alexmirkhaydarov/dotfiles.git "${HOME}/.source/code"
fi

# Check for Homebrew and then install if not found
if /bin/test ! "$(which brew)"; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

echo -e "Brewing..\U1F37A" 
source brew.sh

# Download Prezto and configure if not found
if [[ ! -d "${HOME}/.zprezto" ]]; then
  # Install and configure default Prezto configuration framework
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

  # Run it on zsh shell
  zsh -c 'setopt EXTENDED_GLOB \
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done'
fi

# Download Vundle if .vim directory is not found
if [[ ! -d "${HOME}/.vim" ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git "${HOME}"/.vim/bundle/Vundle.vim

  # Install Plugins
  vim +PluginInstall +qall
fi

# Istall Flutter SDK
if [[ ! -d "${HOME}/.source/flutter_sdk" ]]; then
  git clone https://github.com/flutter/flutter.git -b stable "${HOME}/.source/flutter_sdk"
fi

echo -e "Symlinking.. \U1F517"
DOTFILES_DIR="${HOME}/.source/code/dotfiles"

# Start the symlink
ln -sf "${DOTFILES_DIR}/runcoms/.zpreztorc" "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zpreztorc
ln -sf "${DOTFILES_DIR}/runcoms/.zprofile" "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zprofile
ln -sf "${DOTFILES_DIR}/runcoms/.zshrc" "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zshrc
ln -sf "${DOTFILES_DIR}/functions/prompt_garrett_setup" "${ZDOTDIR:-$HOME}"/.zprezto/modules/prompt/functions/prompt_garrett_setup
ln -sf "${DOTFILES_DIR}/.vimrc" "$HOME"/.vimrc
ln -sf "${DOTFILES_DIR}/.tmux.conf" "$HOME"/.tmux.conf
ln -sf "${DOTFILES_DIR}/.gitconfig" "$HOME"/.gitconfig
ln -sf "$(brew --prefix)/opt/dart/libexec" "$HOME/.source/flutter_sdk/bin/cache/dart-sdk"

echo -e "Finished bootstrapping.. \U1F3AD"
