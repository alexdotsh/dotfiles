#!/usr/bin/env bash

WORKDIR="${HOME}/workspace"
DOTFILES_DIR="${WORKDIR}/code/dotfiles"

if [[ ! -d "${WORKDIR}" ]]; then
  echo "Cloning dotfiles"

  git clone --depth 1 https://github.com/alexmirkhaydarov/dotfiles.git "${DOTFILES_DIR}"
fi
