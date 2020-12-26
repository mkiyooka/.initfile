let s:gvimrc_entrypoint = expand('$HOME/.initfile/gvimrc_entrypoint.vim')
if filereadable(s:gvimrc_entrypoint)
  execute 'source' s:gvimrc_entrypoint
endif

