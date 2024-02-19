#!/usr/bin/env bash
set -euxo pipefail

# allows for running each script individually
[ -z "${COMMON_VARS_SOURCED-}" ] && source "$(dirname "$0")/00-common-vars.sh"

GIT_FOLDER_NAME="${GIT_USERNAME}_${GIT_REPOSITORY}"

brew-file set_repo -r "${DOTFILES_DIR}" -y
rm -rf "${HOME}/.config/brewfile/${GIT_FOLDER_NAME}"
ln -s "${DOTFILES_DIR}" "${HOME}/.config/brewfile/${GIT_FOLDER_NAME}"
brew-file install --format file
