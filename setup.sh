#!/bin/sh -eux

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

for BASE in \
    vimrc \
    gvimrc \
    editorconfig \
    screenrc \
    tmux.conf \
    gitconfig \
    gitignore \
    ctags; do
    ln -fsv $PWD/$BASE ~/.$BASE
done

ln -fsv $HOME/.initfile/vimrc  $HOME/.config/nvim/init.vim
ln -fsv $HOME/.initfile/gvimrc $HOME/.config/nvim/ginit.vim

mkdir -p $HOME/.local/share/nvim/site/autoload
ln -fsv $HOME/.vim/autoload/plug.vim $HOME/.local/share/nvim/site/autoload/plug.vim

mkdir -p ~/doc/wiki
vim -c PlugInstall -c q -c q

