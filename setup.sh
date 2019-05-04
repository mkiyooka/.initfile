#!/bin/sh
SCRIPT_DIR="${PWD}/"`dirname $0`
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -fs $SCRIPT_DIR/vimrc ~/.vimrc
ln -fs $SCRIPT_DIR/gvimrc ~/.gvimrc

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
ln -fs $SCRIPT_DIR/init.vim $XDG_CONFIG_HOME/nvim/init.vim
ln -fs $SCRIPT_DIR/bash_profile $HOME/.bash_profile
ln -fs $SCRIPT_DIR/bashrc $HOME/.bashrc
ln -fs $SCRIPT_DIR/screenrc $HOME/.screenrc
ln -fs $SCRIPT_DIR/gitconfig $HOME/.gitconfig
