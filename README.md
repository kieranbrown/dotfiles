# Dotfiles

## Install

```shell
DOTFILES_DIR="${HOME}/Code/github.com/kieranbrown/dotfiles"
mkdir -p "${DOTFILES_DIR}"
git clone git@github.com:kieranbrown/dotfiles.git "${DOTFILES_DIR}"
cd "${DOTFILES_DIR}"
./etc/install.sh
```

## Notes

- dashlane integration - sync sensitive files such as ssh keys
- automatic configuration of gpgsign
- mac casks installs should populate Brewfile.darwin by default
- integrate mackup
- integrate [".macos" config](https://github.com/driesvints/dotfiles/blob/main/.macos)
