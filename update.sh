#!/bin/bash

VIMDIR="`pwd`"

git pull origin master
git submodule foreach git pull master

# compile binaries for vimproc
cd bundle/vimproc
make
cd -

# compile binaries for YCM
cd bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer --gocode-completer
cd -
