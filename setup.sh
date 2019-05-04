#!/bin/sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.data
export XDG_RUNTIME_DIR=$HOME/.runtime

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_CACHE_HOME
mkdir -p $XDG_DATA_HOME
mkdir -p $XDG_RUNTIME_DIR
mkdir -p $XDG_CONFIG_HOME/nvim

ln -fs $PWD/init.vim $XDG_CONFIG_HOME/nvim/init.vim

for BASE in *rc *profile gitconfig; do
    ln -fsv $PWD/$BASE ~/.$BASE
done
