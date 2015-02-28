#!/usr/bin/env bash

cd $(dirname ${BASH_SOURCE:-$0})
source ../functions/command_exist.sh

if [ $(uname -s) == 'Darwin' ]; then
	if ! command_exist brew; then
		echo 'Installing Homebrew...'
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		brew tap homebrew/dupes
		brew tap homebrew/binary
	fi
fi
