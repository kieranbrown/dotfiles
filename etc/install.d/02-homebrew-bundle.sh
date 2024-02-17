#!/usr/bin/env bash
set -euxo pipefail

brew-file set_repo -r "${DOTFILES_DIR}" -y
rm -rf "${HOME}/.config/brewfile/kieranbrown_dotfiles"
ln -s "${DOTFILES_DIR}" "${HOME}/.config/brewfile/kieranbrown_dotfiles" # todo: don't assume name is kieranbrown_dotfiles
HOMEBREW_BREWFILE_LEAVES=1 HOMEBREW_BREWFILE_ON_REQUEST=1 brew-file install --format file
