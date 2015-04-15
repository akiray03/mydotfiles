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

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

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
brew install tmux zsh zsh-completions git git-extras hub gist tig wget tree lv
brew install bash bash-completion jq md5sha1sum
brew install mobile-shell arping autossh cmake

brew install direnv mysql sqlite python ack ctags nkf pkg-config pidof libtool z
brew install proctools gnu-tar libevent node watch go xz unrar
brew install imagemagick freetype libpng jpeg ec2-api-tools ghostscript mecab mecab-ipadic phantomjs

# for PIL
if [ ! -e /usr/local/include/freetype ]; then
  ln -s /usr/local/include/freetype2 /usr/local/include/freetype
fi

# .dmg
brew cask install google-drive bettertouchtool atom kobito sublime-text coteditor
brew cask install evernote iterm2 alfred virtualbox vagrant dash vlc xquartz
brew cask install skype cinch googleappengine java caskroom/homebrew-versions/java6 
brew cask install pycharm rubymine vmware-fusion gyazo kindle slack hipchat osxfuse
brew cask install mysqlworkbench

# Remove outdated versions
brew cleanup
