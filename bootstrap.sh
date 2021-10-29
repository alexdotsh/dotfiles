#!/usr/bin/env bash

WORKDIR="${HOME}/workspace"
DOTFILES_DIR="${WORKDIR}/code/dotfiles"

echo -e "Start bootstrapping.. \U1F3C1"

# Check for Homebrew and then install if not found
if /bin/test ! "$(which brew)"; then
  echo "Installing Homebrew"

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

echo -e "Brewing..\U1F37A"

source brew.sh

# Setup pure
if [[ ! -d "${HOME}/.zsh/pure" ]]; then
  echo "Cloning pure"

  git clone https://github.com/sindresorhus/pure.git "${HOME}/.zsh/pure"
fi

if [[ ! -f "${HOME}/.dir_colors/dircolors.256dark" ]]; then
  echo "Downloading dircolors.256dark"

  mkdir -p "${HOME}/.dir_colors"
  curl https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.256dark -o "${HOME}/.dir_colors/dircolors.256dark"
fi

# Download Vundle if .vim directory is not found
if [[ ! -d "${HOME}/.vim" ]]; then
  echo "Cloning Vundle and installing plugins"

  git clone https://github.com/VundleVim/Vundle.vim.git "${HOME}/.vim/bundle/Vundle.vim"

  # Install Plugins
  vim +PluginInstall +qall
fi

echo -e "Symlinking.. \U1F517"

# Start the symlink
ln -sf "${DOTFILES_DIR}/functions/zsh_private" "${HOME}/.zsh_private"
ln -sf "${DOTFILES_DIR}/.vimrc" "${HOME}/.vimrc"
ln -sf "${DOTFILES_DIR}/.tmux.conf" "${HOME}/.tmux.conf"
ln -sf "${DOTFILES_DIR}/.gitconfig" "${HOME}/.gitconfig"

/usr/local/bin/code && sleep 5
if [[ ! -f "${HOME}/Library/Application Support/Code/User/settings.json" ]]; then
  touch "${HOME}/Library/Application Support/Code/User/settings.json"
fi

if [[ ! -f "${HOME}/Library/Application Support/Code/User/keybindings.json" ]]; then
  touch "${HOME}/Library/Application Support/Code/User/keybindings.json"
fi

ln -sf "${DOTFILES_DIR}/vscode/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"
ln -sf "${DOTFILES_DIR}/vscode/keybindings.json" "${HOME}/Library/Application Support/Code/User/keybindings.json"

if [[ ! -f "${HOME}/.zshrc" ]]; then
  touch "${HOME}/.zshrc"
fi

if grep -Fxq "[ -r ${HOME}/.zsh_private ] && source ${HOME}/.zsh_private" "${HOME}/.zshrc"
then
  echo ''
else
  echo "[ -r ${HOME}/.zsh_private ] && source ${HOME}/.zsh_private" >> "${HOME}/.zshrc"
fi

echo -e "Finished bootstrapping.. \U1F3AD"
