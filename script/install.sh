#!/usr/bin/env bash

command_exist() {
	local command="$1"
	command -v "$command" > /dev/null  2> /dev/null
	return $?
}

target_path="$HOME/.mydotfiles"

if [ -d "$target_path" ]; then
	echo "Already installed : $target_path"
	exit 1
fi

if ! command_exist git; then
	echo "Installing git ..."

	if command_exist apt-get; then
		sudo apt-get install --yes git
	elif command_exist yum; then
		sudo yum install -y git
	elif command_exist brew; then
		brew install git
	else
		echo "Cannot install git. Aborting.."
		exit 1
	fi
fi

git clone https://github.com/akiray03/mydotfiles.git "$target_path"

"$target_path/bin/dotfiles-sync"

echo "Done."
