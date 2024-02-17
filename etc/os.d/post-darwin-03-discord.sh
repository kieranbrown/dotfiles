#!/usr/bin/env bash
set -euxo pipefail

cd "${HOME}/Downloads"

if [ ! -d /Applications/Discord.app ]; then
  wget --content-disposition https://discord.com/api/download?platform=osx
  hdiutil mount Discord.dmg
  cp -R "/Volumes/Discord/Discord.app" /Applications
  hdiutil unmount "/Volumes/Discord"
  rm -f Discord.dmg
fi

if [ ! -f "/Applications/Discord.app/Contents/Resources/_app.asar" ]; then
  killall VencordInstaller || true
  rm -rf VencordInstaller*;
  wget https://github.com/Vencord/Installer/releases/latest/download/VencordInstaller.MacOs.zip;
  unzip VencordInstaller.MacOs.zip;
  open -a VencordInstaller.app;
fi
