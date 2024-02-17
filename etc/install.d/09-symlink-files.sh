#!/usr/bin/env bash
set -euxo pipefail

dcli sync

symlink_file() {
  local filename="$1"
  local copy_type="${2:-symlink}"

  local source="${DOTFILES_DIR}/${filename}"
  local target="${HOME}/${filename}"
  rm -f "${target}"

  if grep -q 'dl://' "${source}" || [ "${copy_type}" == "copy" ]; then
    dcli inject -i "${source}" -o "${target}"
  else
    ln -s "${source}" "${target}"
  fi
}

# special handling for ssh files as they need chmod 600
# disable symlinking as git will reset to 0644
# and chmod to 600 after copying
for filename in .ssh/id_rsa .ssh/id_rsa.pub; do
  echo "Symlinking ${filename}"
  symlink_file "${filename}" copy
  chmod 600 "${HOME}/${filename}"
done

for filename in .gitconfig .gitconfig.chatloop .hushlogin .vimrc .zshrc; do
  echo "Symlinking ${filename}"
  symlink_file "${filename}"
done
