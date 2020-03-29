#!/usr/bin/env bash

echo "Running bootstrap"

# Check for Homebrew and then install if not found

if /bin/test ! "$(which brew)"; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew update

# Brew install
brew install git # Updated version of git

# Cask install
brew cask install iterm2
brew cask install visual-studio-code

echo "Finished bootstrap"
