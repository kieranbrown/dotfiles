#!/usr/bin/env bash
set -euxo pipefail

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
