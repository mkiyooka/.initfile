#!/bin/sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

for BASE in \
	bash_profile \
	bashrc \
	vimrc \
	gvimrc \
	screenrc \
	gitconfig; do
    ln -fsv $PWD/$BASE ~/.$BASE
done

vim -c PlugInstall -c q -c q

