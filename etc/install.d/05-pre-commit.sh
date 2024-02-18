#!/usr/bin/env bash
set -euxo pipefail

# allows for running each script individually
[ -z "${COMMON_VARS_SOURCED-}" ] && source "$(dirname "$0")/00-common-vars.sh"

PRE_COMMIT_ARGS=(-t commit-msg -t pre-commit)

if [[ ! -d "${HOME}/.git-template" ]]; then
  pre-commit init-templatedir "${PRE_COMMIT_ARGS[@]}" "${HOME}/.git-template"
fi

pre-commit install "${PRE_COMMIT_ARGS[@]}";
