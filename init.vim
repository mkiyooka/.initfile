set guioptions=
let s:common = expand('$HOME/initfile/common.vim')
if filereadable(s:common)
  execute 'source' s:common
endif

let s:rc_mapping = expand('$HOME/initfile/mapping.vim')
if filereadable(s:rc_mapping)
  execute 'source' s:rc_mapping
endif

