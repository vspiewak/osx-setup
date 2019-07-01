#!/usr/bin/env bash

CURRENT_DIR=$(dirname $0)

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

${CURRENT_DIR}/update-osx.sh

${CURRENT_DIR}/xcode-cli-tools.sh

${CURRENT_DIR}/brew.sh