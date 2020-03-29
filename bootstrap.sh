#!/usr/bin/env bash

echo "Running bootstrap"

# xcode-select --install

# Check for Homebrew and then install if not found

if /bin/test ! "$(which brew)"; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew update

tap 'homebrew/cask'

# Brew install
brew install git # Updated version of git

echo "Finished bootstrap"
