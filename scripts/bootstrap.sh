#!/usr/bin/env bash

# todo: move this into a linux-pre-bootstrap.sh
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install build-essential

if [[ $(command -v brew) == "" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
  test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

HOMEBREW_PREFIX="$(brew --prefix)"

test -f ${HOMEBREW_PREFIX}/bin/zsh || brew install zsh

if [[ ! -d "~/.oh-my-zsh" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_PATH="${HOMEBREW_PREFIX}/bin/zsh"
if ! grep -q -- "$ZSH_PATH" /etc/shells; then
  echo "$ZSH_PATH" | sudo tee -a /etc/shells;
  chsh -s "$ZSH_PATH"
fi

if ! -f "${HOMEBREW_PREFIX}/etc/brew-wrap"; then
  brew install rcmdnk/file/brew-file
  source ${HOMEBREW_PREFIX}/etc/brew-wrap
fi

rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" -avh --no-perms . ~

$ZSH_PATH
