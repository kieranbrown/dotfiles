#!/usr/bin/env bash
set -euxo pipefail

if [ "$(uname)" != "Darwin" ]; then
  echo "Operating system is not Darwin"; exit 1
fi

# Set computer name (as done via System Preferences → Sharing)
DEFAULT_HOSTNAME="$(scutil --get HostName)"
read -p "Please enter your desired HostName [$DEFAULT_HOSTNAME]: " HOSTNAME
HOSTNAME=${HOSTNAME:-${DEFAULT_HOSTNAME}}

if [[ "$HOSTNAME" != "$DEFAULT_HOSTNAME" ]]; then
  sudo scutil --set ComputerName "$HOSTNAME"
  sudo scutil --set HostName "$HOSTNAME"
  sudo scutil --set LocalHostName "$HOSTNAME"
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$HOSTNAME"
fi

xcode-select --install &> /dev/null || true

until xcode-select --print-path &> /dev/null; do
  echo 'waiting for xcode-select --install'
  sleep 5;
done
