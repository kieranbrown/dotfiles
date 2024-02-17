#!/usr/bin/env bash
set -euxo pipefail

softwareupdate --install --all

softwareupdate --install-rosetta --agree-to-license

xcode-select --install &> /dev/null || true

until xcode-select --print-path &> /dev/null; do
  echo 'waiting for xcode-select --install'
  sleep 5;
done
