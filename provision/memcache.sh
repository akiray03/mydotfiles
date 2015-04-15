#!/bin/bash

set -ex

brew install memcached
mkdir -p ~/Library/LaunchAgents
ln -sfv /usr/local/opt/memcached/homebrew.mxcl.memcached.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist
