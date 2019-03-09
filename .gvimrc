let s:common = expand('$HOME/initfiles/common.vim')
if filereadable(s:common)
  execute 'source' s:common
endif

let s:rc_plug_mapping = expand('$HOME/initfiles/plug_mapping.vim')
if filereadable(s:rc_plug_mapping)
  execute 'source' s:rc_plug_mapping
endif

set guioptions=
if filereadable(expand('~/.config/repos/github.com/tomasr/molokai/colors/molokai.vim'))
  colorscheme molokai
else
  colorscheme slate
endif
