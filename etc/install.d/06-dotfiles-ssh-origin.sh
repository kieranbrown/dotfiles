#!/usr/bin/env bash
set -euxo pipefail

# allows for running each script individually
[ -z "${COMMON_VARS_SOURCED-}" ] && source "$(dirname "$0")/00-common-vars.sh"

git remote set-url origin "git@${GIT_HOST}:${GIT_USERNAME}/${GIT_REPOSITORY}.git"
