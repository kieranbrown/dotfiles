#!/usr/bin/env bash
set -euxo pipefail

# enable dark mode
osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true'

# Turn on battery percentage in menu bar
defaults -currentHost write com.apple.controlcenter.plist BatteryShowPercentage -bool true

# Disable "Click to reveal desktop"
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# Display the time with seconds enabled
defaults write com.apple.menuextra.clock ShowSeconds -bool true

# Remove spotlight from the menu bar
defaults -currentHost write com.apple.Spotlight MenuItemHidden -bool true

# Set Arc as the default browser
defaultbrowser browser # annoyingly registered as "browser" but it's actually Arc
