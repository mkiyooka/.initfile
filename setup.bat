curl -fLo %HOME%\vimfiles\autoload\plug.vim --create-dirs ^
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mklink %HOME%\.bash_profile %HOME%\.initfile\bash_profile
mklink %HOME%\.bashrc %HOME%\.initfile\bashrc
mklink %HOME%\.vimrc %HOME%\.initfile\vimrc
mklink %HOME%\.gvimrc %HOME%\.initfile\gvimrc
mklink %HOME%\.screenrc %HOME%\.initfile\screenrc
mklink %HOME%\.tmux.config %HOME%\.initfile\tmux.config
mklink %HOME%\.gitconfig %HOME%\.initfile\gitconfig
mklink %HOME%\.gitignore %HOME%\.initfile\gitignore

mkdir -p ~/doc/wiki
vim -c PlugInstall -c q -c q
