# ディレクトリ構成

```text
~/
|-- .config/ # = %XDG_CONFIG_HOME%
|   |-- nvim/
|       |-- init.vim
|-- initfiles/ # vim config files directories
|   |-- common.vim
|   |-- get_plugins.vim
|   |-- mapping.vim
|   |-- plug_mapping.vim
|-- _vimrc # how to
|-- _gvimrc/ # how to
|-- .ssh/ # how to
|-- .conda/ # how to
|-- .condarc # how to
    |-- .condarc # how to
```

``` text
~/
 |-- .bashrc
 |-- .vimrc -> /Users/mkiyo/initfile/.vimrc
 |-- .gvimrc -> /Users/mkiyo/initfile/.gvimrc
 |-- initfile/
 |   |-- README.md
 |   |-- common.vim
 |   |-- get_plugins.vim
 |   |-- init.vim
 |   |-- mapping.vim
 |   |-- plug_mapping.vim
 |   |-- setup.bat
 |   |-- setup.sh
 |-- .vim/autoload/
 |-- .vim/plugged/
 |-- .config/nvim/init.vim -> ~/initfile/init.vim
 |-- .config/nvim/plugged/
```
