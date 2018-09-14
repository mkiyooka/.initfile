setx HOME=C:\home
setx XDG_CACHE_HOME=%HOME%\.cache
setx XDG_CONFIG_HOME=%HOME%\.config
setx XDG_DATA_HOME=%HOME%\.data
setx XDG_RUNTIME_DIR=%HOME%\.runtime

REM for neovim
mkdir %XDG_CONFIG_HOME%\nvim
xcopy /E nvim %XDG_CONFIG_HOME%\nvim\

REM for vim and gvim
xcopy /E init.vim %XDG_CONFIG_HOME%\nvim\
xcopy /E _vimrc   %HOME%\
xcopy /E _gvimrc  %HOME%\
