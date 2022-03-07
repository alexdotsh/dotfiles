#!/usr/bin/env bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"

if [ $? -ne 0 ]; then
    exit 1
    echo "brew not installed or not in PATH"
fi

rm -rf /opt/homebrew

WORKDIR="${HOME}/workspace"
