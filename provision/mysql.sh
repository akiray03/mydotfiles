#!/bin/bash

set -ex

brew install mysql
mkdir -p ~/Library/LaunchAgents/
ln -sfv /usr/local/opt/mysql/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
/usr/local/opt/mysql/bin/mysql_secure_installation
