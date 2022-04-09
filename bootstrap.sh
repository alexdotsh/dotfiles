#!/usr/bin/env bash

set -euo pipefail

echo -e "Start bootstrapping \U1F3C1\U1F3C1\U1F3C1"

echo -e "Brewing..\U1F37A\U1F37A\U1F37A"

source "$(dirname "${BASH_SOURCE[0]}")/brew.sh"

# Setup pure
if [ ! -d "${HOME}/.zsh/pure" ]; then
    echo "Cloning pure"

    git clone --depth 1 https://github.com/sindresorhus/pure.git "${HOME}/.zsh/pure"
fi

if [ ! -f "${HOME}/.dir_colors/dircolors.256dark" ]; then
    echo "Downloading dircolors.256dark"

    mkdir -p "${HOME}/.dir_colors"
    curl https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.256dark -o "${HOME}/.dir_colors/dircolors.256dark"
fi

source "$(dirname "${BASH_SOURCE[0]}")/symlink.sh"

echo -e "Finished bootstrapping \U1F3AD\U1F3AD\U1F3AD"
