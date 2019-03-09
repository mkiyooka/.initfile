set guioptions=
let s:common = expand('$HOME/initfile/common.vim')
if filereadable(s:common)
  execute 'source' s:common
endif
"source $HOME/initfiles/common.vim
