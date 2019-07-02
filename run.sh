#!/usr/bin/env bash

CURRENT_DIR=$(dirname $0)

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for hostname
echo  -n "Hostname: "
IFS= read -e -r CUSTOM_HOSTNAME

# Ask for the administrator password upfront
echo "Enter root password"
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo scutil --set ComputerName "${CUSTOM_HOSTNAME}"
sudo scutil --set LocalHostName "${CUSTOM_HOSTNAME}"
sudo scutil --set HostName "${CUSTOM_HOSTNAME}"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "${CUSTOM_HOSTNAME}"

${CURRENT_DIR}/update-osx.sh

${CURRENT_DIR}/xcode-cli-tools.sh

${CURRENT_DIR}/brew.sh

${CURRENT_DIR}/atom.sh

${CURRENT_DIR}/osx.sh

${CURRENT_DIR}/dock.sh
