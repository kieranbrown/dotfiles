#!/usr/bin/env bash
set -euxo pipefail

# unassign cmd+space + cmd+option+space from using spotlight
# once the mac is rebooted alfred can be configured to use cmd+space
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 64 "<dict><key>enabled</key><false/></dict>"
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 65 "<dict><key>enabled</key><false/></dict>"
