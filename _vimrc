let s:common = expand('$HOME/initfiles/common.vim')
if filereadable(s:common)
  execute 'source' s:common
endif
"source $HOME/initfiles/common.vim
