#!/usr/bin/env bash
set -e

if [ "$(uname)" != "Linux" ]; then
  echo "Operating system is not Linux"; exit 1
fi
