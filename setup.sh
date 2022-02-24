#!/bin/bash

set -xeuo pipefail

dotfiles_dir=/workspaces/.codespaces/.persistedshare/dotfiles

if ! [ -d $dotfiles_dir ]; then
  echo "Oh no! $dotfiles_dir not found"
  exit 1
fi

# shellcheck disable=SC2129
echo hello >> ~/setup.txt

cp -rv "$dotfiles_dir"/* ~/ 1>&2 >> ~/setup.txt

echo "setup.sh" >> ~/setup.txt
