# remove recently used apps from dock
defaults write com.apple.dock show-recents -bool no
defaults write com.apple.dock recent-apps -array # intentionally empty

# reboot dock
killall Dock
