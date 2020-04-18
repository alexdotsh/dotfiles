#!/usr/bin/env bash

echo "Running bootstrapping"

if [[ ! -d "$HOME/.source" ]]; then
  git clone --recursive https://github.com/alexmirkhaydarov/dotfiles.git "$HOME/.source"
fi

# Check for Homebrew and then install if not found
if /bin/test ! "$(which brew)"; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Update ond upgrade brew
brew update
brew upgrade

# Brew bundle
brew bundle

# Download Prezto and configure if not found
if [[ ! -d "$HOME/.zprezto" ]]; then
  # Install and configure default Prezto configuration framework
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

  # Run it on zsh shell
  zsh -c 'setopt EXTENDED_GLOB \
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done'
fi

# Download Vundle if .vim directory is not found
if [[ ! -d "$HOME/.vim" ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git "$HOME"/.vim/bundle/Vundle.vim

  # Install Plugins
  vim +PluginInstall +qall
fi

# Istall Flutter SDK
if [[ ! -d "$HOME/.source/flutter_sdk" ]]; then
  git clone https://github.com/flutter/flutter.git -b stable "$HOME/.source/flutter_sdk"
fi

# Start the symlink
ln -sf "$HOME/.source/dotfiles/runcoms/.zpreztorc" "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zpreztorc
ln -sf "$HOME/.source/dotfiles/runcoms/.zprofile" "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zprofile
ln -sf "$HOME/.source/dotfiles/runcoms/.zshrc" "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zshrc
ln -sf "$HOME/.source/dotfiles/functions/prompt_garrett_setup" "${ZDOTDIR:-$HOME}"/.zprezto/modules/prompt/functions/prompt_garrett_setup
ln -sf "$HOME/.source/dotfiles/.vimrc" "$HOME"/.vimrc
ln -sf "$HOME/.source/dotfiles/.tmux.conf" "$HOME"/.tmux.conf

# symlink dart sdk to Flutter bin
if [[ -d "$HOME/.source/flutter_sdk/bin/cache/dart-sdk" ]]; then
  ln -sf "$(brew --prefix)/opt/dart/libexec" "$HOME/.source/flutter_sdk/bin/cache/dart-sdk"
fi

echo "Finished bootstrapping"
