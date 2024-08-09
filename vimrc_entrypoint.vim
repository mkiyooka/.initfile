let s:common = expand('$HOME/.initfile/common.vim')
if filereadable(s:common)
  execute 'source' s:common
endif

let s:rc_mapping = expand('$HOME/.initfile/mapping.vim')
if filereadable(s:rc_mapping)
  execute 'source' s:rc_mapping
endif

let s:rc_switch_buffer = expand('$HOME/.initfile/switch_buffer.vim')
if filereadable(s:rc_switch_buffer)
  execute 'source' s:rc_switch_buffer
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

augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction
