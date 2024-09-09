

rem run with administrator privileges.







curl -fLo %HOME%\vimfiles\autoload\plug.vim --create-dirs ^
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

rem ----- shell -----
del %HOME%\.bash_profile
del %HOME%\.bashrc
del %HOME%\.colorrc
mklink   %HOME%\.bash_profile   %HOME%\.initfile\shell\bash_profile
mklink   %HOME%\.bashrc         %HOME%\.initfile\shell\bashrc
mklink   %HOME%\.colorrc        %HOME%\.initfile\shell\colorrc

rem ----- terminal multiplexer -----
del %HOME%\.screenrc
del %HOME%\.tmux.config
mklink   %HOME%\.screenrc       %HOME%\.initfile\termxscreenrc
mklink   %HOME%\.tmux.config    %HOME%\.initfile\termxtmux.config

rem ----- git -----
del %HOME%\.gitconfig
del %HOME%\.gitignore
mklink   %HOME%\.gitconfig      %HOME%\.initfile\git\gitconfig
mklink   %HOME%\.gitignore      %HOME%\.initfile\gitignore

rem ----- ssh -----
mkdir -p %HOME%\.ssh
del %USERPROFILE%\.ssh
mklink /D %USERPROFILE%\.ssh %HOME%\.ssh

rem ----- vim -----
del %HOME%\.vimrc
del %HOME%\.gvimrc
mklink   %HOME%\.vimrc          %HOME%\.initfile\vimrc
mklink   %HOME%\.gvimrc         %HOME%\.initfile\gvimrc

mkdir -p %HOME%\.config\nvim
del %HOME%\.vimrc
del %HOME%\.gvimrc
mklink  %HOME%\.config\nvim\init.vim   %HOME%\.initfile\vim\vimrc
mklink  %HOME%\.config\nvim\ginit.vim  %HOME%\.initfile\vim\gvimrc
mkdir -p %HOME%\.config\goneovim
del %HOME%\.initfile\vim\settings.toml
mklink  %HOME%\.config\goneovim\settings.toml  %HOME%\.initfile\vim\settings.toml

mkdir -p %HOME%\.local\share\nvim\site\autoload
del %HOME%\.local\share\nvim\site\autoload\plug.vim
mklink %HOME%\.local\share\nvim\site\autoload\plug.vim %HOME%\.vim\autoload\plug.vim 

mkdir -p %HOME%\doc\wiki
vim -c PlugInstall -c q -c q

rem ----- editor -----
del %HOME%\.editorconfig
del %HOME%\.ctags
mklink  %HOME%\.editorconfig  %HOME%\.initfile\editor\editorconfig
mklink  %HOME%\.ctags         %HOME%\.initfile\editor\ctags

rem clangd setting
mkdir %HOME%\.config\clangd
del %HOME%\.config\clangd\config.yaml
mklink %HOME%\.config\clangd\config.yaml %HOME%\.initfile\editor\clangd_config.yaml

rem XDG_CONFIG_HOME  $HOME/.config
rem XDG_CACHE_HOME   $HOME/.cache
rem XDG_DATA_HOME    $HOME/.local/share
rem XDG_STATE_HOME   $HOME/.local/state
rem XDG_RUNTIME_HOME $HOME/.local/run
