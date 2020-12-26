curl -fLo %HOME%\vimfiles\autoload\plug.vim --create-dirs ^
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

REM for vim and gvim
xcopy /E %HOME%\initfile\bash_profile %HOME%\.bash_profile
xcopy /E %HOME%\initfile\bashrc       %HOME%\.bashrc
xcopy /E %HOME%\initfile\vimrc        %HOME%\.vimrc
xcopy /E %HOME%\initfile\gvimrc       %HOME%\.gvimrc
xcopy /E %HOME%\initfile\screenrc     %HOME%\.screenrc
xcopy /E %HOME%\initfile\gitconfig    %HOME%\.gitconfig

vim -c PlugInstall -c q -c q

