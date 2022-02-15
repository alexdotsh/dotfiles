#!/usr/bin/env bash

WORKDIR="${HOME}/workspace"
DOTFILES_DIR="${WORKDIR}/code/projects/alexdotsh/dotfiles"

if [[ ! -d "${WORKDIR}" ]]; then
    echo "Cloning dotfiles"

    git clone --depth 1 https://github.com/alexmirkhaydarov/dotfiles.git "${DOTFILES_DIR}"
fi

# Check for Homebrew and then install if not found
if /bin/test ! "$(which brew)"; then
    echo "Installing Homebrew"

    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && "${DOTFILES_DIR}"/bootstrap.sh
fi
