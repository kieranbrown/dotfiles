#!/usr/bin/env bash
set -euxo pipefail

export COMMON_VARS_SOURCED=true

export GIT_HOST="github.com"
export GIT_USERNAME="kieranbrown"
export GIT_REPOSITORY="dotfiles"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DOTFILES_DIR=$(realpath "${SCRIPT_DIR}/../../")
export DOTFILES_DIR

# shellcheck source=../../.zsh_exports
source "${DOTFILES_DIR}/.zsh_exports"

# shellcheck source=../../.zsh_aliases
source "${DOTFILES_DIR}/.zsh_aliases"
