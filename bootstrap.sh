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

echo "Finished bootstrap"
