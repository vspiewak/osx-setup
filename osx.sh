# remove recently used apps from dock
defaults write com.apple.dock show-recents -bool no
defaults write com.apple.dock recent-apps -array # intentionally empty

# organize dock
dockutil --remove Siri
dockutil --remove Launchpad
dockutil --remove  "Préférences Système"

# reboot dock
killall Dock
