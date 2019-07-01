# remove recently used apps from dock
defaults write com.apple.dock show-recents -bool no
defaults write com.apple.dock recent-apps -array # intentionally empty

# organize dock
dockutil --remove com.apple.SiriViewService
dockutil --remove com.apple.launchpad.launcher
dockutil --remove com.apple.systempreferences

# reboot dock
killall Dock
