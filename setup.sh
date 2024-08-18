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

mkdir -p $HOME/.ssh

ln -fsv $HOME/.initfile/vimrc  $HOME/.config/nvim/init.vim
ln -fsv $HOME/.initfile/gvimrc $HOME/.config/nvim/ginit.vim

case "${OSTYPE}" in
    darwin*)
        mkdir -p $HOME/.local/share/nvim/site/autoload
        ln -fsv $HOME/.vim/autoload/plug.vim $HOME/.local/share/nvim/site/autoload/plug.vim
        ;;
    linux*)
        mkdir -p $HOME/.local/share/nvim/site/autoload
        ln -fsv $HOME/.vim/autoload/plug.vim $HOME/.local/share/nvim/site/autoload/plug.vim
        ;;
    msys*)
        mkdir -p $HOME/.local/share/nvim-data/site/autoload
        ln -fsv $HOME/.vim/autoload/plug.vim $HOME/.local/share/nvim-data/site/autoload/plug.vim
        ;;
esac

mkdir -p ~/doc/wiki
vim -c PlugInstall -c q -c q

# clangd setting
ln -fsv $PWD/clangd_config.yaml $HOME/.config/clangd/config.yaml
