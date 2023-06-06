#!/bin/bash

set -e

arduino-cli core --additional-urls=https://support.acpad.com/download/package_acpad_index.json update-index
arduino-cli core --additional-urls=https://support.acpad.com/download/package_acpad_index.json install acpad:samd
arduino-cli core --additional-urls=https://support.acpad.com/download/package_acpad_index.json upgrade
