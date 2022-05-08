#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="${HOME}/workspace/projects/alexdotsh/code/.dotfiles"

if [ ! -d "${DOTFILES_DIR}" ]; then
    echo "Cloning dotfiles"

    git clone --depth 1 https://github.com/alexdotsh/dotfiles.git "${DOTFILES_DIR}"
fi

# Check for Homebrew and then install if not found
if ! which brew 2>&1 > /dev/null; then
    echo "Installing Homebrew"

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "${HOME}/.zprofile"
    eval "$(/opt/homebrew/bin/brew shellenv)"

    brew --help

    if [ $? -ne 0 ]; then
        exit 1
        echo "brew not installed or not in PATH"
    fi
fi

pushd "${DOTFILES_DIR}"
    ./bootstrap.sh
popd
