curl -fLo %HOME%\vimfiles\autoload\plug.vim --create-dirs ^
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

del %HOME%\.bash_profile
del %HOME%\.bashrc
del %HOME%\.vimrc
del %HOME%\.gvimrc
del %HOME%\.editorconfig
del %HOME%\.screenrc
del %HOME%\.tmux.config
del %HOME%\.gitconfig
del %HOME%\.gitignore
del %HOME%\.ctags

mklink   %HOME%\.bash_profile   %HOME%\.initfile\bash_profile
mklink   %HOME%\.bashrc         %HOME%\.initfile\bashrc
mklink   %HOME%\.vimrc          %HOME%\.initfile\vimrc
mklink   %HOME%\.gvimrc         %HOME%\.initfile\gvimrc
mklink   %HOME%\.editorconfig   %HOME%\.initfile\editorconfig
mklink   %HOME%\.screenrc       %HOME%\.initfile\screenrc
mklink   %HOME%\.tmux.config    %HOME%\.initfile\tmux.config
mklink   %HOME%\.gitconfig      %HOME%\.initfile\gitconfig
mklink   %HOME%\.gitignore      %HOME%\.initfile\gitignore
mklink   %HOME%\.gitignore      %HOME%\.initfile\ctags

mkdir -p %HOME%\.ssh

mkdir -p %HOME%\.config\nvim
mklink  %HOME%\.config\nvim\init.vim   %HOME%\.initfile\vimrc
mklink  %HOME%\.config\nvim\ginit.vim  %HOME%\.initfile\gvimrc
mkdir -p %HOME%\.config\goneovim
mklink  %HOME%\.config\goneovim\settings.toml  %HOME%\.initfile\settings.toml

mkdir -p %HOME%\.local\share\nvim\site\autoload
mklink %HOME%\.local\share\nvim\site\autoload\plug.vim %HOME%\.vim\autoload\plug.vim 

mkdir -p ~\doc\wiki
vim -c PlugInstall -c q -c q

rem clangd setting
mkdir %HOME%\.config\clangd
mklink %HOME%\.config\clangd\config.yaml %HOME%\.initfile\clangd_config.yaml

rem XDG_CONFIG_HOME  $HOME/.config
rem XDG_CACHE_HOME   $HOME/.cache
rem XDG_DATA_HOME    $HOME/.local/share
rem XDG_STATE_HOME   $HOME/.local/state
rem XDG_RUNTIME_HOME $HOME/.local/run
