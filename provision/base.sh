#!/usr/bin/env bash

cd $(dirname ${BASH_SOURCE:-$0})
source ../functions/command_exist.sh

./prepare.sh || exit 1

if [ $(uname -s) == 'Darwin' ]; then
  brew install git tree zsh zsh-completions tmux
elif command_exist apt-get; then
  sudo apt-get install --yes git screen tree zsh sudo
elif command_exist yum; then
  sudo yum install -y git screen tree zsh sudo
fi
