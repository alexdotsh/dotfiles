#!/usr/bin/env bash

echo "Running bootstrap"

# Check for Homebrew and then install if not found
if /bin/test ! "$(which brew)"; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Update brew
brew update

# Brew bundle
brew bundle

# Create project source directory
mkdir -p ~/.source

# Install and configure default Prezto configuration framework
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Run it on zsh shell
zsh -c 'setopt EXTENDED_GLOB \
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done'

echo "Finished bootstrap"
