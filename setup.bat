curl -fLo %HOME%\vimfiles\autoload\plug.vim --create-dirs ^
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

del %HOME%\.bash_profile
del %HOME%\.bashrc
del %HOME%\.vimrc
del %HOME%\.gvimrc
del %HOME%\.screenrc
del %HOME%\.tmux.config
del %HOME%\.gitconfig
del %HOME%\.gitignore
del %HOME%\.ctags

mklink %HOME%\.bash_profile %HOME%\.initfile\bash_profile
mklink %HOME%\.bashrc %HOME%\.initfile\bashrc
mklink %HOME%\.vimrc %HOME%\.initfile\vimrc
mklink %HOME%\.gvimrc %HOME%\.initfile\gvimrc
mklink %HOME%\.screenrc %HOME%\.initfile\screenrc
mklink %HOME%\.tmux.config %HOME%\.initfile\tmux.config
mklink %HOME%\.gitconfig %HOME%\.initfile\gitconfig
mklink %HOME%\.gitignore %HOME%\.initfile\gitignore
mklink %HOME%\.gitignore %HOME%\.initfile\ctags

mkdir -p ~/doc/wiki
vim -c PlugInstall -c q -c q
