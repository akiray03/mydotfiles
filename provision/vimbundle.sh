#!/bin/bash

if [ ! -d $HOME/.vim/bundle ]; then
	echo "NeoBundle install..."
	mkdir -p $HOME/.vim/bundle
	git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
	git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc
fi
