#!/usr/bin/env bash
set -euxo pipefail

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install build-essential -y
