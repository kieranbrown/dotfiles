#!/usr/bin/env bash
set -euxo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DOTFILES_DIR=$(realpath "${SCRIPT_DIR}/../")
export SCRIPT_DIR DOTFILES_DIR

run_scripts() {
  local script_pattern="$1"
  local original_dir="$PWD"

  shopt -s nullglob
  # shellcheck disable=SC2206
  scripts=($script_pattern)
  shopt -u nullglob

  if [ ${#scripts[@]} -eq 0 ]; then
      echo "No matching scripts found."
      return 0
  fi

  for script in "${scripts[@]}"; do
    echo "Running script: $script"
    # shellcheck source=/dev/null
    source "$script"
    cd "${original_dir}" # in case any script decides to move directories
  done
}

os_setup() {
  case "$(uname -sr)" in

  Darwin*)
    run_scripts "${SCRIPT_DIR}/os.d/$1-darwin-*.sh"
    ;;

  Linux*WSL*)
    run_scripts "${SCRIPT_DIR}/os.d/$1-linux-*.sh"
    run_scripts "${SCRIPT_DIR}/os.d/$1-wsl-*.sh"
    ;;

  Linux*)
    run_scripts "${SCRIPT_DIR}/os.d/$1-linux-*.sh"
    ;;

  *)
    echo 'Unsupported os'; exit 1;
    ;;
esac
}

# todo: add fresh.sh file that runs the commands in the readme
# todo: add nice outputs throughout
# todo: add support for github codespaces (install.sh needs moving to root)
main() {
  os_setup "pre"
  run_scripts "${SCRIPT_DIR}/install.d/*.sh"
  os_setup "post"
}

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

(cd "${DOTFILES_DIR}"; main; exec ${ZSH_PATH:-/bin/zsh} -l)
