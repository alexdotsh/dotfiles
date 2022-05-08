#!/usr/bin/env bash

set -euo pipefail

echo -e "Symlinking.. \U1F517"

# Start the symlink
ln -sf "${DOTFILES_DIR}/functions/zsh_private" "${HOME}/.zsh_private"
ln -sf "${DOTFILES_DIR}/.vimrc" "${HOME}/.vimrc"
ln -sf "${DOTFILES_DIR}/.tmux.conf" "${HOME}/.tmux.conf"
ln -sf "${DOTFILES_DIR}/.gitconfig" "${HOME}/.gitconfig"

"${HOMEBREW_PREFIX}/bin/code" && sleep 5

if [ ! -f "${HOME}"/Library/Application\ Support/Code/User/settings.json ]; then
    touch "${HOME}"/Library/Application\ Support/Code/User/settings.json
fi

if [ ! -f "${HOME}"/Library/Application\ Support/Code/User/keybindings.json ]; then
    touch "${HOME}"/Library/Application\ Support/Code/User/keybindings.json
fi

ln -sf "${DOTFILES_DIR}/vscode/settings.json" "${HOME}"/Library/Application\ Support/Code/User/settings.json
ln -sf "${DOTFILES_DIR}/vscode/keybindings.json" "${HOME}"/Library/Application\ Support/Code/User/keybindings.json

if [ ! -f "${HOME}/.zshrc" ]; then
    touch "${HOME}/.zshrc"
fi

if grep -Fxq "[ -r ${HOME}/.zsh_private ] && source ${HOME}/.zsh_private" "${HOME}/.zshrc"; then
    echo ''
else
    echo "[ -r ${HOME}/.zsh_private ] && source ${HOME}/.zsh_private" >> "${HOME}/.zshrc"
fi
