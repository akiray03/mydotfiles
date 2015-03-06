#!/usr/bin/env bash

cd $(dirname ${BASH_SOURCE:-$0})
source ../functions/command_exist.sh

./prepare.sh || exit 1

if [ $(uname -s) != 'Darwin' ]; then
  echo "No support OS: $(uname -s)"
  exit 1
fi

if ! command_exist brew; then
  echo 'brew does not found.'
  exit 1
fi

# Make sure using latest Homebrew
brew update

# Update already-installed formula (takes too much time, I will do it manually later)
# upgrade

# Add Repository
brew tap homebrew/versions || true
brew tap phinze/homebrew-cask || true
brew tap homebrew/binary || true
brew tap sonots/mycask || true
brew install brew-cask

set -e

# Build tools
brew install gcc autoconf automake cmake

# ruby-build depends
# https://github.com/sstephenson/ruby-build/wiki
brew install openssl libyaml readline libffi libxml2 libxslt

# Packages
brew install tmux
brew install zsh zsh-completions
brew install git git-extras hub gist tig
brew install wget tree lv
brew install bash bash-completion
brew install arping jq
brew install md5sha1sum

brew install direnv

brew install mysql sqlite

brew install python

brew install autossh
brew cask install osxfuse
brew install ack
brew install ctags
brew install nkf
brew install pkg-config
brew install pidof
brew install libtool
brew install z
brew install proctools
brew install gnu-tar
brew install libevent
brew install node
brew install watch
brew install go
brew install xz
brew install unrar

brew install imagemagick freetype libpng jpeg

# for PIL
ln -s /usr/local/include/freetype2 /usr/local/include/freetype

# .dmg
brew cask install dropbox 1password
brew cask install google-chrome
brew cask install atom kobito sublime-text coteditor
brew cask install evernote
brew cask install remote-desktop-connection
brew cask install iterm2
brew cask install alfred
brew cask install virtualbox
brew cask install vagrant
# cask install echofon
brew cask install dash
#cask install vlc
brew cask install xquartz
# brew cask install yorufukurou
brew cask install skype
brew cask install cinch
brew cask install googleappengine
brew cask install pycharm
brew cask install rubymine
brew cask install wireshark
brew cask install vmware-fusion
brew cask install gyazo
brew cask install kindle

# Remove outdated versions
brew cleanup
