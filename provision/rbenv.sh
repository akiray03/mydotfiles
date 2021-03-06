#!/usr/bin/env bash

cd $(dirname ${BASH_SOURCE:-$0})
source ../functions/command_exist.sh

./prepare.sh || exit 1

if [ $(uname -s) == 'Darwin' ]; then
  brew install openssl libyaml readline
  export RUBY_CONFIGURE_OPTS=--with-readline-dir="$(brew --prefix readline)"
elif command_exist apt-get; then
  sudo apt-get install --yes build-essential autoconf libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev
fi

rbenv_setup() {
  if ! command_exist rbenv; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
  fi
}

if [[ -d "$HOME/.rbenv" ]]; then
  rbenv_setup
  rbenv update
else
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
  git clone https://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update
fi

rbenv_setup

ruby_version="$1"

if [[ -z $ruby_version ]]; then
  ruby_version="$(basename "$(ls ~/.rbenv/plugins/ruby-build/share/ruby-build/2.2.* | egrep -v 'dev|pre|rc' | sort | tail -1)")"
fi

rbenv install "$ruby_version"
rbenv global "$ruby_version"

gem update --system
gem install bundler pry awesome_print
gem clean
