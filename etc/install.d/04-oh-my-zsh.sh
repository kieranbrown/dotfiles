#!/usr/bin/env bash
set -euxo pipefail

if [[ ! -d "${HOME}/.oh-my-zsh" ]]; then
  echo 'Installing oh-my-zsh'
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  rm -rf ${HOME}/.zshrc.pre*
fi
