#!/usr/bin/env bash
set -e

if [ "$(uname)" != "Darwin" ]; then
  echo "Operating system is not Darwin"; exit 1
fi
