#!/bin/sh -eux

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

for BASE in \
	vimrc \
	gvimrc \
	editorconfig \
	screenrc \
	gitconfig; do
    ln -fsv $PWD/$BASE ~/.$BASE
done

mkdir -p ~/doc/wiki
vim -c PlugInstall -c q -c q

