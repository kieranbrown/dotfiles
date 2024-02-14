#!/usr/bin/env bash
set -euxo pipefail

if [ "$(uname)" != "Darwin" ]; then
  echo "Operating system is not Darwin"; exit 1
fi

xcode-select --install &> /dev/null

until xcode-select --print-path &> /dev/null; do
  sleep 5;
done
