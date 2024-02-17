#!/usr/bin/env bash
set -euxo pipefail

defaults write com.apple.dock persistent-apps -array

add_to_dock() {
  local app="$1"
  local behaviour="${2:-always}"

  if [ "$behaviour" == "if_exists" ] && [ ! -f "$app" ]; then
    return
  fi

  dockutil --add "$app" --no-restart
}

add_to_dock '/Applications/Arc.app'
add_to_dock '/Applications/Visual Studio Code.app'
add_to_dock '/Applications/Warp.app'
add_to_dock '/Applications/TablePlus.app'
add_to_dock '/Applications/Mail.app'
add_to_dock '/Applications/Spotify.app'
add_to_dock '/Applications/Slack.app'
add_to_dock '/Applications/Microsoft Teams (work or school).app' 'if_exists'

killall Dock
