#!/usr/bin/env bash

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi

# Install other useful binaries.
brew install dark-mode
brew install git
brew install tree
brew install golang

# Install Heroku
brew install heroku/brew/heroku
heroku update

# Core casks
brew cask install --appdir="~/Applications" iterm2

brew tap AdoptOpenJDK/openjdk
brew cask install --appdir="~/Applications" adoptopenjdk11

# Development tool casks
brew cask install --appdir="/Applications" atom

# Misc casks
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" vlc

brew cask install --appdir="/Applications" google-drive

brew cask install --appdir="/Applications" intellij-idea

# Install Docker
brew cask install --appdir="/Applications" docker

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package quicklookase qlvideo

# Remove outdated versions from the cellar.
brew cleanup
