setx XDG_CACHE_HOME %HOME%\.cache
setx XDG_CONFIG_HOME %HOME%\.config
setx XDG_DATA_HOME %HOME%\.data
setx XDG_RUNTIME_DIR %HOME%\.runtime

mkdir %XDG_CONFIG_HOME%
mkdir %XDG_CONFIG_HOME%\nvim

REM for vim and gvim
xcopy /E _vimrc   %HOME%\
xcopy /E _gvimrc  %HOME%\
xcopy /E init.vim %XDG_CONFIG_HOME%\nvim
