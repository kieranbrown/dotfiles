#!/usr/bin/env bash
set -euxo pipefail

# allows for running each script individually
[ -z "${COMMON_VARS_SOURCED-}" ] && source "$(dirname "$0")/00-common-vars.sh"

if [[ $(command -v brew) == "" ]]; then
  echo 'Installing brew'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
  test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  test -d /opt/homebrew && eval "$(/opt/homebrew/bin/brew shellenv)"
fi

HOMEBREW_PREFIX="$(brew --prefix)"
export HOMEBREW_PREFIX

if [[ ! -f "${HOMEBREW_PREFIX}/bin/brew-file" ]]; then
  echo 'Installing brew-file'
  brew install rcmdnk/file/brew-file
fi
