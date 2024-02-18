#!/usr/bin/env bash
set -euxo pipefail

# allows for running each script individually
[ -z "${COMMON_VARS_SOURCED-}" ] && source "$(dirname "$0")/00-common-vars.sh"

export ZSH_PATH="${HOMEBREW_PREFIX}/bin/zsh"

if ! grep -q -- "$ZSH_PATH" /etc/shells; then
  echo 'Setting zsh as default shell'
  echo "$ZSH_PATH" | sudo tee -a /etc/shells
  chsh -s "$ZSH_PATH"
fi
