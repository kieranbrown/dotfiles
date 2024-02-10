#!/usr/bin/env bash
set -euxo pipefail

for filename in .gitconfig .gitconfig.chatloop .hushlogin .vimrc .zshrc; do
  echo "Symlinking ${filename}"
  rm -f "${HOME}/${filename}"
  ln -s "${DOTFILES_DIR}/${filename}" "${HOME}/${filename}"
done

echo "Symlinking Brewfile"
CUSTOM_BREWFILE="${DOTFILES_DIR}/Brewfile.$(uname -n)"

touch "${CUSTOM_BREWFILE}"
rm -f "${HOME}/.Brewfile"
ln -s "${CUSTOM_BREWFILE}" "${HOME}/.Brewfile"
