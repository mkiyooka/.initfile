curl -fLo %HOME%\vimfiles\autoload\plug.vim --create-dirs ^
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
setx XDG_CONFIG_HOME %HOME%\.config
setx XDG_CACHE_HOME %HOME%\.cache
setx XDG_DATA_HOME %HOME%\.data
setx XDG_RUNTIME_DIR %HOME%\.runtime

mkdir %XDG_CONFIG_HOME%
mkdir %XDG_CACHE_HOME%
mkdir %XDG_DATA_HOME%
mkdir %XDG_RUNTIME_DIR%
mkdir %XDG_CONFIG_HOME%\nvim
curl -fLo %HOME%\.local\share\nvim\site\autoload\plug.vim --create-dirs ^
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

REM for vim and gvim
xcopy /E %HOME%\initfile\bash_profile %HOME%\.bash_profile
xcopy /E %HOME%\initfile\bashrc       %HOME%\.bashrc
xcopy /E %HOME%\initfile\vimrc        %HOME%\.vimrc
xcopy /E %HOME%\initfile\gvimrc       %HOME%\.gvimrc
xcopy /E %HOME%\initfile\screenrc     %HOME%\.screenrc
xcopy /E %HOME%\initfile\gitconfig    %HOME%\.gitconfig
xcopy /E %HOME%\initfile\gvimrc       %XDG_CONFIG_HOME%\nvim\init.vim

