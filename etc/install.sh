#!/usr/bin/env bash
set -euxo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DOTFILES_DIR=$(realpath "${SCRIPT_DIR}/../")
export SCRIPT_DIR DOTFILES_DIR

"${SCRIPT_DIR}/symlink-files.sh"

case "$(uname -sr)" in

  Darwin*)
    echo 'Setting up Darwin'
    "${SCRIPT_DIR}/setup-darwin.sh"
    ;;

  Linux*WSL*)
    echo 'Setting up WSL'
    "${SCRIPT_DIR}/setup-linux.sh"
    "${SCRIPT_DIR}/setup-wsl.sh"
    ;;

  Linux*)
    echo 'Setting up Linux'
    "${SCRIPT_DIR}/setup-linux.sh"
    ;;

  *)
    echo 'Unsupported os'; exit 1;
    ;;
esac

if [[ $(command -v brew) == "" ]]; then
  echo 'Installing brew'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
  test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

HOMEBREW_PREFIX="$(brew --prefix)"
ZSH_PATH="${HOMEBREW_PREFIX}/bin/zsh"

test -f "${ZSH_PATH}" || brew install zsh

if [[ ! -d "${HOME}/.oh-my-zsh" ]]; then
  echo 'Installing oh-my-zsh'
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if ! grep -q -- "$ZSH_PATH" /etc/shells; then
  echo 'Setting zsh as default shell'
  echo "$ZSH_PATH" | sudo tee -a /etc/shells
  chsh -s "$ZSH_PATH"
fi

if [[ ! -f "${HOMEBREW_PREFIX}/etc/brew-wrap" ]]; then
  echo 'Installing brew-file'
  brew install rcmdnk/file/brew-file
fi

set +eu
source ${HOMEBREW_PREFIX}/etc/brew-wrap
brew set_repo -r "${DOTFILES_DIR}" -y
rm -rf ${HOME}/.config/brewfile/kieranbrown_dotfiles
ln -s "${DOTFILES_DIR}" "${HOME}/.config/brewfile/kieranbrown_dotfiles" # todo: don't assume name is kieranbrown_dotfiles
HOMEBREW_BREWFILE_LEAVES=1 brew file update
set -eu

if [[ ! -d "${HOME}/.git-template" ]]; then
  pre-commit init-templatedir -t commit-msg -t pre-commit ${HOME}/.git-template
fi
