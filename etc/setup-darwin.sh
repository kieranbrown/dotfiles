#!/usr/bin/env bash
set -euxo pipefail

if [ "$(uname)" != "Darwin" ]; then
  echo "Operating system is not Darwin"; exit 1
fi

# todo: xcode-select install / update
