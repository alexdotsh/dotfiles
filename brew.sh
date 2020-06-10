#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Update brew itself
brew update

# Upgrade formulas to the latest version
brew upgrade

# Bundle install from Brewfile
brew bundle

# Cleanup outdated versions from Cellar
brew cleanup
