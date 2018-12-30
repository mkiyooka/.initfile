let s:rc_mapping = expand('$HOME/initfiles/mapping.vim')
if filereadable(s:rc_mapping)
  execute 'source' s:rc_mapping
endif
