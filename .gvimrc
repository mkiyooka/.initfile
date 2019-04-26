let s:common = expand('$HOME/initfile/common.vim')
if filereadable(s:common)
  execute 'source' s:common
endif

let s:rc_plug_mapping = expand('$HOME/initfile/plug_mapping.vim')
if filereadable(s:rc_plug_mapping)
  execute 'source' s:rc_plug_mapping
endif

set lines=40
set columns=100

set guioptions=
