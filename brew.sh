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

# Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# symlink dart sdk to Flutter bin
if [[ ! -d "$HOME/.source/flutter_sdk/bin/cache/dart-sdk" ]]; then
  ln -sf "${BREW_PREFIX}/opt/dart/libexec" "$HOME/.source/flutter_sdk/bin/cache/dart-sdk"
fi
