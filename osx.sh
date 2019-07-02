# remove recently used apps from dock
defaults write com.apple.dock show-recents -bool no
defaults write com.apple.dock recent-apps -array # intentionally empty

# organize dock
#dockutil --remove com.apple.SiriViewService
#dockutil --remove com.apple.launchpad.launcher
#dockutil --remove com.apple.systempreferences
#dockutil --remove com.apple.mail
#dockutil --remove com.apple.AddressBook
#dockutil --remove com.apple.iCal
#dockutil --remove com.apple.Maps
#dockutil --remove com.apple.reminders
#dockutil --remove com.apple.Notes
#dockutil --remove com.apple.Photos

dockutil --remove all

dockutil --add "~/Applications/iTerm.app" --position 1
dockutil --add "/Applications/Firefox.app" --position 2
dockutil --add "/Applications/Google Chrome.app" --position 3
dockutil --add "/Applications/Safari.app" --position 4
dockutil --add "/Applications/Slack.app" --position 5
dockutil --add "/Applications/Atom.app" --position 6
dockutil --add "/Applications/IntelliJ IDEA.app" --position 7
dockutil --add "/Applications/VLC.app" --position 8

dockutil --add '~/Downloads' --view fan --display stack
