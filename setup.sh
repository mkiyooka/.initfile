#!/bin/sh
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.data
export XDG_RUNTIME_DIR=$HOME/.runtime

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.local/share/nvim/site/autoload/
cp ~/.vim/autoload/plug.vim ~/.local/share/nvim/site/autoload/plug.vim

mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_CACHE_HOME
mkdir -p $XDG_DATA_HOME
mkdir -p $XDG_RUNTIME_DIR
mkdir -p $XDG_CONFIG_HOME/nvim

ln -fs $PWD/init.vim $XDG_CONFIG_HOME/nvim/init.vim

for BASE in \
	bash_profile \
	bashrc \
	vimrc \
	gvimrc \
	screenrc \
	gitconfig; do
    ln -fsv $PWD/$BASE ~/.$BASE
done
