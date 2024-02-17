#!/usr/bin/env bash
set -euxo pipefail

if [ "$(uname)" != "Linux" ]; then
  echo "Operating system is not Linux"; exit 1
fi
