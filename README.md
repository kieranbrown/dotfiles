# todo:

- .git-template/hooks contains references to /home/linuxbrew, perhaps ${HOMEBREW_PREFIX} is fine here
- process for syncing dotfiles on change
- vimrc tabs are being weird
- gitconfig gpgsign / how to have different keyID across multiple machines
- .zshrc contains NVM_HOMEBREW=$(brew --prefix) perhaps this could be changed to use ${HOMEBREW_PREFIX}
- check tfenv / tgenv installs correct arch across windows / mac
- pull in chatloop Brewfile seperately using "file" function in brew-file
- pinentry-mac is mac only - provide a way to install specific applications across specific arch
  - they had docs on how to do this, file Brewfile.$whatever
