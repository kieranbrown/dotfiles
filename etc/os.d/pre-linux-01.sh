#!/usr/bin/env bash
set -euxo pipefail

if [ "$(uname)" != "Linux" ]; then
  echo "Operating system is not Linux"; exit 1
fi

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install build-essential -y
