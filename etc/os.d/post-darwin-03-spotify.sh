#!/usr/bin/env bash
set -euxo pipefail

if [ ! -d /Applications/Spotify.app ]; then
  yes | bash <(curl -sSL https://spotx-official.github.io/run.sh) -B --installmac
fi

# - enable "prioritise Spotify"
# - hide from menu bar
open -a MacMediaKeyForwarder
