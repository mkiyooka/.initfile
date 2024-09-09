REM run with administrator privileges
del %USERPROFILE%\.ssh
mklink /D %USERPROFILE%\.ssh %HOME%\.ssh
