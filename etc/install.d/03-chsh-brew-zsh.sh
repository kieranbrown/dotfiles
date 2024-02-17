#!/usr/bin/env bash
set -euxo pipefail

export ZSH_PATH="${HOMEBREW_PREFIX}/bin/zsh"

if ! grep -q -- "$ZSH_PATH" /etc/shells; then
  echo 'Setting zsh as default shell'
  echo "$ZSH_PATH" | sudo tee -a /etc/shells
  chsh -s "$ZSH_PATH"
fi
