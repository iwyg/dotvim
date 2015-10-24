#!/bin/sh


VIMDIR="`pwd`"

# create temp directory
mkdir -p tmp

# Install pathogen plugin manager:
#curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install submodules:
git submodule update --init --recursive

## install powerline if not already installed 
## switched from powerline to airline
#if [ "which powerline" == "" ]; then
#	pip install powerline-status
#else
#	echo "powerline alread installed"
#fi

# Install homebrew packagemanager:
if [ "which brew" == "" ]; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "Homebrew already installed"
fi

# Update homebrew packagemanager:
brew -v update
# Install recent git version
brew -v install git --HEAD --with-blk-sha1 --with-gettext --with-pcre --with-persistent-https

# Install golang:
if [ "which go" == "" ]; then
	brew -v install go
fi
# Install the nodejs and npm:
if [ "which npm" == "" ]; then
	brew -v install node 
else
	echo "nodejs and npm already installed"
fi

# Install composer:
if [ "which composer" == "" ]; then
	cd tmp
	curl -sS https://getcomposer.org/installer | php
	mv composer.phar /usr/local/bin/composer
	cd -
	mkdir ~/.composer
	echo "{\"require\": {}}" > ~/.composer/composer.json
else
	echo "composer already installed"
fi


# install required php utilities
composer global require squizlabs/php_codesniffer techlivezheng/phpctags fabpot/php-cs-fixer mkusher/padawan
# install required javascript  utilities
npm -g update
npm -g install jsxhintrc jsctags babel webpack livedown

mv $VIMDIR/vimrc $VIMDIR/vimconfig
mv $VIMDIR/gvimrc $VIMDIR/gvimconfig
rm ~/.vimrc
rm ~/.gvimrc

# link bundles to the bundles_loaded firectory 
mkdir -p $VIMDIR/bundles_loaded
cd bundles_loaded
ln -s ../bundle/* .
cd -

# install the ANSI Escape Sequence plugin
curl -Sso $VIMDIR/tmp/AnsiEsc.vba.gz http://www.vim.org/scripts/download_script.php?src_id=14498
cd tmp
vim AnsiEsc.vba.gz -c ':so %' -c ':q'
cd -

# compile binaries for vimproc
cd bundle/vimproc
make
cd -

# compile binaries for YCM
cd bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer --gocode-completer
cd -

# move back configfiles
mv $VIMDIR/vimconfig $VIMDIR/vimrc
mv $VIMDIR/gvimconfig $VIMDIR/gvimrc
# symlink  configuration files
(ln -s $VIMDIR/vimrc $HOME/.vimrc && ln -s $VIMDIR/gvimrc $HOME/.gvimrc) || ln log

# cleanup
rm -rf tmp