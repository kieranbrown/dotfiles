#!/usr/bin/env bash
set -euxo pipefail

defaults write com.apple.dock persistent-apps -array

add_to_dock() {
  local app="$1"
  dockutil --add "$app" --no-restart
}

add_to_dock_if_exists() {
  local app="$1"

  if [ -d "$app" ]; then
    add_to_dock "$app"
  fi
}

add_to_dock '/Applications/Arc.app'
add_to_dock '/Applications/Visual Studio Code.app'
add_to_dock '/Applications/Warp.app'
add_to_dock '/Applications/TablePlus.app'
add_to_dock '/Applications/Mail.app'
add_to_dock '/Applications/Spotify.app'
add_to_dock_if_exists '/Applications/Slack.app'
add_to_dock_if_exists '/Applications/Microsoft Teams (work or school).app'

killall Dock
