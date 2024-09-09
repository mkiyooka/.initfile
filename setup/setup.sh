#!/bin/sh -eux

# On windows, run with administrator privileges.
case "${OSTYPE}" in
    msys*)
        export MSYS=winsymlinks:nativestrict
        ln -fsv $HOME/.ssh /c/Users/$USERNAME/.ssh
        ;;
esac

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# shell
#rm $HOME/.bashrc
#rm $HOME/.bash_profile
#rm $HOME/.colorrc
ln -fsv  $HOME/.initfile/shell/bashrc        $HOME/.bashrc
ln -fsv  $HOME/.initfile/shell/bash_profile  $HOME/.bash_profile
ln -fsv  $HOME/.initfile/shell/colorrc       $HOME/.colorrc

# terminal multiplexer
#rm $HOME/.screenrc
#rm $HOME/.tmux.conf
ln -fsv  $HOME/.initfile/termx/screenrc   $HOME/.screenrc
ln -fsv  $HOME/.initfile/termx/tmux.conf  $HOME/.tmux.conf

# git
#rm $HOME/.gitconfig
#rm $HOME/.gitignore
ln -fsv  $HOME/.initfile/git/gitconfig  $HOME/.gitconfig
ln -fsv  $HOME/.initfile/git/gitignore  $HOME/.gitignore

# ssh
mkdir -p $HOME/.ssh
#sudo chmod 700 $HOME/.ssh


# vim
#rm $HOME/.vimrc
#rm $HOME/.gvimrc
ln -fsv  $HOME/.initfile/vim/vimrc  $HOME/.vimrc
ln -fsv  $HOME/.initfile/vim/gvimrc $HOME/.gvimrc

mkdir -p $HOME/.config/nvim
#rm $HOME/.config/nvim/init.vim
#rm $HOME/.config/nvim/ginit.vim
ln -fsv  $HOME/.initfile/vim/vimrc         $HOME/.config/nvim/init.vim
ln -fsv  $HOME/.initfile/vim/gvimrc        $HOME/.config/nvim/ginit.vim
mkdir -p $HOME/.config/goneovim
#rm $HOME/.config/goneovim/settings.toml
ln -fsv  $HOME/.initfile/vim/settings.toml $HOME/.config/goneovim/settings.toml

mkdir -p $HOME/.local/share/nvim/site/autoload
#rm $HOME/.local/share/nvim/site/autoload/plug.vim
ln -fsv  $HOME/.vim/autoload/plug.vim $HOME/.local/share/nvim/site/autoload/plug.vim

mkdir -p $HOME/doc/wiki
vim -c PlugInstall -c q -c q

# editor
#rm $HOME/.editorconfig
#rm $HOME/.ctags
ln -fsv  $HOME/.initfile/editor/editorconfig  $HOME/.editorconfig
ln -fsv  $HOME/.initfile/editor/ctags         $HOME/.ctags

# clangd setting
mkdir -p $HOME/.config/clangd
#rm $HOME/.config/clangd/config.yaml
ln -fsv  $HOME/.initfile/editor/clangd_config.yaml $HOME/.config/clangd/config.yaml

# XDG_CONFIG_HOME  $HOME/.config
# XDG_CACHE_HOME   $HOME/.cache
# XDG_DATA_HOME    $HOME/.local/share
# XDG_STATE_HOME   $HOME/.local/state
# XDG_RUNTIME_HOME $HOME/.local/run
