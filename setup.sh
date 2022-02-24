#!/bin/bash

set -xeuo pipefail

# change to script directory
cd "$(dirname "$0")"

# shellcheck disable=SC2129
echo hello >> ~/setup.txt

cp -rv ./* ~/ 1>&2 >> ~/setup.txt

echo "setup.sh" >> ~/setup.txt
