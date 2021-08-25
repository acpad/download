#!/bin/bash

set -e

if [[ "$1" == "--clean" ]]; then
  rm -f versioduo-samd-*
fi

rm -rf arduino-board-package
git clone --depth=1 git@github.com:acpad/arduino-board-package
(cd arduino-board-package && git submodule update --init --recursive --remote --recommend-shallow)

rm -rf samd/
mkdir samd/

cp -a  arduino-board-package/{variants,boards.txt,platform.txt} samd/
cp -a  arduino-board-package/ArduinoCore-samd/cores samd/
cp -aL  arduino-board-package/libraries/ samd/libraries/

version=$(grep 'version=' arduino-board-package/platform.txt | sed -E 's/.*version=([0-9]*).*/\1/')

# Create reproducible tar, use the timestamp of the last commit from the board package repository.
date=$(git log -1 --format=%cd arduino-board-package)
#tar --numeric-owner --owner=0 --group=0 --sort=name --clamp-mtime --mtime="$date" -cjf acpad-samd-$version.tar.bz2 samd/
tar --numeric-owner -cjf acpad-samd-$version.tar.bz2 samd/

hash=$(shasum -a 256 acpad-samd-$version.tar.bz2 | sed -E 's/ .*//')

cp package_acpad_index.json.in package_acpad_index.json
sed -i '' -E "s/@@VERSION@@/$version/" package_acpad_index.json
sed -i '' -E "s/@@HASH@@/$hash/" package_acpad_index.json

rm -rf arduino-board-package
rm -rf samd/
git add acpad-samd-$version.tar.bz2
