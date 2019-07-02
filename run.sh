#!/usr/bin/env bash

CURRENT_DIR=$(dirname $0)

# Ask for the administrator password upfront
echo "Enter root password"
sudo -v

# Ask for hostname
read "Enter hostname: " 
read CUSTOM_HOSTNAME
sudo scutil --set ComputerName "$CUSTOM_HOSTNAME"
sudo scutil --set LocalHostName "$CUSTOM_HOSTNAME"
sudo scutil --set HostName "$CUSTOM_HOSTNAME"

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

${CURRENT_DIR}/update-osx.sh

${CURRENT_DIR}/xcode-cli-tools.sh

${CURRENT_DIR}/brew.sh

${CURRENT_DIR}/atom.sh

${CURRENT_DIR}/osx.sh
