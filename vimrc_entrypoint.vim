let s:common = expand('$HOME/.initfile/common.vim')
if filereadable(s:common)
  execute 'source' s:common
endif

let s:rc_mapping = expand('$HOME/.initfile/mapping.vim')
if filereadable(s:rc_mapping)
  execute 'source' s:rc_mapping
endif

let s:rc_gvim_mapping = expand('$HOME/.initfile/gvim_mapping.vim')
if has('gui') && filereadable(s:rc_gvim_mapping)
  execute 'source' s:rc_gvim_mapping
endif

let s:rc_plug_mapping = expand('$HOME/.initfile/plug_mapping.vim')
if filereadable(s:rc_plug_mapping)
  execute 'source' s:rc_plug_mapping
endif

if has('gui')
  set lines=40
  set columns=100

  " GUI menu bar is not present
  set guioptions=

  " encode setting for menu
  source $VIMRUNTIME/delmenu.vim
  set langmenu=ja_jp.utf-8
  source $VIMRUNTIME/menu.vim
endif

set conceallevel=0
set concealcursor=n
