#!/bin/bash

set -ex

brew install elasticsearch
mkdir -p ~/Library/LaunchAgents
ln -sfv /usr/local/opt/elasticsearch/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist

brew list --versions | grep elasticsearch
