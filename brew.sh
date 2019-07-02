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
brew install dockutil
brew install git
brew install tree
brew install sbt
brew install golang
brew install jq
brew install kubernetes-helm

# Install nvm / node / yarn
brew install nvm
mkdir ~/.nvm

if ! command grep -qc '/nvm.sh' ~/.profile; then
  command printf "\n" >> ~/.profile
  command printf "export NVM_DIR=~/.nvm\n" >> ~/.profile
  command printf "source $(brew --prefix nvm)/nvm.sh\n" >> ~/.profile
  command printf "\n" >> ~/.profile
fi

source ~/.profile

nvm install --lts
nvm use default

npm install -g yarn


# Install Heroku
brew install heroku/brew/heroku
heroku update

# Casks
brew cask install google-cloud-sdk

brew cask install --appdir="~/Applications" iterm2

brew cask install --appdir="~/Applications" java

brew cask install --appdir="/Applications" atom

brew cask install --appdir="/Applications" firefox

brew cask install --appdir="/Applications" google-chrome

brew cask install --appdir="/Applications" skype

brew cask install --appdir="/Applications" telegram

brew cask install --appdir="/Applications" whatsapp

brew cask install --appdir="/Applications" slack

brew cask install --appdir="/Applications" vlc

brew cask install --appdir="/Applications" google-backup-and-sync

brew cask install --appdir="/Applications" intellij-idea

brew cask install --appdir="/Applications" docker

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package quicklookase qlvideo

# Remove outdated versions from the cellar.
brew cleanup
