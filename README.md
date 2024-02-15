# Dotfiles

## Install

```shell
DOTFILES_DIR="${HOME}/Code/github.com/kieranbrown/dotfiles"
mkdir -p "${DOTFILES_DIR}"
git clone https://github.com/kieranbrown/dotfiles.git "${DOTFILES_DIR}"
cd "${DOTFILES_DIR}"
./etc/install.sh
```

## Notes

- dashlane integration - sync sensitive files such as ssh keys
  - change origin of repo to ssh after ssh key sync
- use github ssh key commit signing instead of gpg
- integrate mackup
- integrate [".macos" config](https://github.com/driesvints/dotfiles/blob/main/.macos)
- disable brew-file from writing to Brewfiles, it's buggy and annoying
  - configure brew-file to always use the '--format file' option
