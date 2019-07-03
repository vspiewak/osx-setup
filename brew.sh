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
brew install vim
if ! command grep -qc 'vim' ~/.profile; then
  command printf 'export PATH="'$(brew --prefix vim)'/bin:$PATH"\n\n' >> ~/.profile
fi


# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
if ! command grep -qc 'coreutils' ~/.profile; then
  command printf 'export PATH="'$(brew --prefix coreutils)'/libexec/gnubin:$PATH"\n' >> ~/.profile
fi

brew install moreutils
if ! command grep -qc 'moreutils' ~/.profile; then
  command printf 'export PATH="'$(brew --prefix moreutils)'/libexec/bin:$PATH"\n' >> ~/.profile
fi

brew install findutils
if ! command grep -qc 'findutils' ~/.profile; then
  command printf 'export PATH="'$(brew --prefix findutils)'/libexec/gnubin:$PATH"\n' >> ~/.profile
fi

brew install gnu-tar
if ! command grep -qc 'gnu-tar' ~/.profile; then
  command printf 'export PATH="'$(brew --prefix gnu-tar)'/libexec/gnubin:$PATH"\n' >> ~/.profile
fi

brew install gnu-sed
if ! command grep -qc 'gnu-sed' ~/.profile; then
  command printf 'export PATH="'$(brew --prefix gnu-sed)'/libexec/gnubin:$PATH"\n' >> ~/.profile
fi

brew install gnutls
if ! command grep -qc 'gnutls' ~/.profile; then
  command printf 'export PATH="'$(brew --prefix gnutls)'/bin:$PATH"\n' >> ~/.profile
fi

brew install gawk
if ! command grep -qc 'gawk' ~/.profile; then
  command printf 'export PATH="'$(brew --prefix gawk)'/libexec/gnubin:$PATH"\n' >> ~/.profile
fi

brew install gnu-indent
if ! command grep -qc 'gnu-indent' ~/.profile; then
  command printf 'export PATH="'$(brew --prefix gnu-indent)'/libexec/gnubin:$PATH"\n' >> ~/.profile
fi

brew install gnu-getopt
if ! command grep -qc 'gnu-getopt' ~/.profile; then
  command printf 'export PATH="'$(brew --prefix gnu-getopt)'/bin:$PATH"\n' >> ~/.profile
fi

brew install grep
if ! command grep -qc 'grep' ~/.profile; then
  command printf 'export PATH="'$(brew --prefix grep)'/libexec/gnubin:$PATH"\n' >> ~/.profile
fi
command printf '\n' >> ~/.profile


# Install GNU Bash
brew install bash

#  We installed the new shell, now we have to activate it
if ! command grep -qc '/usr/local/bin/bash' /etc/shells; then
  sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
fi

# Change to the new shell, prompts for password
#chsh -s /usr/local/bin/bash
sudo chsh -s /usr/local/bin/bash $(whoami)

# Install bash completions
brew install bash-completion@2

if ! command grep -qc 'bash_completion' ~/.profile; then
  command printf '[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"\n\n' >> ~/.profile
fi


# Install other useful binaries.
brew install dark-mode
brew install dockutil
brew install git
brew install tree
brew install sbt
brew install golang
brew install jq

# Install k8s stuffs
brew install kubernetes-helm
brew install kubernetes-cli

if ! command grep -qc 'kubectl completion' ~/.profile; then
  command printf 'source <(kubectl completion bash)\n\n' >> ~/.profile
fi


# Install nvm / node / yarn
brew install nvm
mkdir ~/.nvm

if ! command grep -qc '/nvm.sh' ~/.profile; then
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
