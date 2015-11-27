#!/bin/sh

set -e

# Install homebrew packagemanager:
if [ 'which brew' == '' ]; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo 'Homebrew already installed'
fi

# Update homebrew packagemanager:
brew -v update
# Install recent git version
brew -v install git --HEAD --with-blk-sha1 --with-gettext --with-pcre --with-persistent-https

# Install golang:
if [ 'which go' == '' ]; then
	brew -v install go
fi

# Install the nodejs and npm:
if [ 'which npm' == '' ]; then
	brew -v install node 
else
	echo 'nodejs and npm already installed'
fi
