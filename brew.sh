#!/usr/bin/env bash

# Update brew itself
brew update

# Upgrade formulas to the latest version
brew upgrade

# Bundle install from Brewfile
brew bundle

# Cleanup outdated versions from Cellar
brew cleanup

# Mas upgrade
mas upgrade
