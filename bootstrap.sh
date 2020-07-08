#!/usr/bin/env bash

echo -e "Start bootstrapping.. \U1F3C1"

WORKDIR="${HOME}/workspace"
export WORKDIR

if [[ ! -d "${WORKDIR}" ]]; then
  echo "Cloning dotfiles"

  git clone --recursive https://github.com/alexmirkhaydarov/dotfiles.git "${WORKDIR}/code"
fi

# Check for Homebrew and then install if not found
if /bin/test ! "$(which brew)"; then
  echo "Installing Homebrew"

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

echo -e "Brewing..\U1F37A"
# shellcheck disable=SC1091
source brew.sh

# Download Prezto and configure if not found
if [[ ! -d "${HOME}/.zprezto" ]]; then
  echo "Cloning prezto and initializing"

  # Install and configure default Prezto configuration framework
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${HOME}/.zprezto"

  # Run it on zsh shell		
  /bin/zsh -c 'setopt EXTENDED_GLOB;		
  for rcfile in "${HOME}"/.zprezto/runcoms/^README.md(.N); do		
    ln -s "$rcfile" "${HOME}/.${rcfile:t}"		
  done'
fi

# Download Vundle if .vim directory is not found
if [[ ! -d "${HOME}/.vim" ]]; then
  echo "Cloning Vundle and installing plugins"

  git clone https://github.com/VundleVim/Vundle.vim.git "${HOME}/.vim/bundle/Vundle.vim"

  # Install Plugins
  vim +PluginInstall +qall
fi

# Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install Flutter SDK
if [[ ! -d "${WORKDIR}/flutter_sdk" ]]; then
  echo "Cloning Flutter and setting up Dart"

  git clone https://github.com/flutter/flutter.git -b stable "${WORKDIR}/flutter_sdk"

  # symlink dart sdk to Flutter bin
  ln -sf "${BREW_PREFIX}/opt/dart/libexec" "${WORKDIR}/flutter_sdk/bin/cache/dart-sdk"
fi

echo -e "Symlinking.. \U1F517"
DOTFILES_DIR="${PWD}"

# Start the symlink
ln -sf "${DOTFILES_DIR}/functions/zsh_private" "${HOME}/.zsh_private"
ln -sf "${DOTFILES_DIR}/functions/prompt_garrett_setup" "${HOME}/.zprezto/modules/prompt/functions/prompt_garrett_setup"
ln -sf "${DOTFILES_DIR}/.vimrc" "${HOME}/.vimrc"
ln -sf "${DOTFILES_DIR}/.tmux.conf" "${HOME}/.tmux.conf"
ln -sf "${DOTFILES_DIR}/.gitconfig" "${HOME}/.gitconfig"

if grep -Fxq "[ -r ${HOME}/.zsh_private ] && source ${HOME}/.zsh_private" "${HOME}/.zshrc"
then
  echo ''
else
  echo "[ -r ${HOME}/.zsh_private ] && source ${HOME}/.zsh_private" >> "${HOME}/.zshrc"
fi

echo -e "Finished bootstrapping.. \U1F3AD"
