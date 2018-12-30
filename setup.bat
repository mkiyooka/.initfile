setx XDG_CACHE_HOME=%HOME%\.cache
setx XDG_CONFIG_HOME=%HOME%\.config
setx XDG_DATA_HOME=%HOME%\.data
setx XDG_RUNTIME_DIR=%HOME%\.runtime

mkdir %XDG_CONFIG_HOME%

REM for vim and gvim
xcopy /E _vimrc   %HOME%\
xcopy /E _gvimrc  %HOME%\
