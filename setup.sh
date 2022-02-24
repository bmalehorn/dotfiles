#!/bin/bash

set -xeuo pipefail

dotfiles_dir=/workspaces/.codespaces/.persistedshare/dotfiles

if ! [ -d $dotfiles_dir ]; then
  echo "Oh no! $dotfiles_dir not found"
  exit 1
fi

# shellcheck disable=SC2129
echo hello >> ~/setup.txt

# copy hidden + non-hidden files
# https://superuser.com/a/547166
shopt -s dotglob # for considering dot files (turn on dot files)
cp -rv "$dotfiles_dir"/* ~/ 1>&2 >> ~/setup.txt
shopt -u dotglob

echo "setup.sh" >> ~/setup.txt
