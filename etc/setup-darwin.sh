#!/usr/bin/env bash
set -euxo pipefail

if [ "$(uname)" != "Darwin" ]; then
  echo "Operating system is not Darwin"; exit 1
fi

xcode-select --install &> /dev/null || true

until xcode-select --print-path &> /dev/null; do
  echo 'waiting for xcode-select --install'
  sleep 5;
done
