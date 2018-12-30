if &compatible
  set nocompatible
endif

if has('nvim')
  let $NVIM_HOME = expand('$HOME/.config')
  let s:dein_dir = $NVIM_HOME
else
  let $VIM_HOME =  expand('$HOME/.config')
  let s:dein_dir = $VIM_HOME
endif

if !exists('g:dein_loaded')
  "let s:dein_repo_dir = s:dein_dir.'/repos/github.com/Shougo/dein.vim'
  let s:dein_repo_dir = expand('$HOME/.config/repos/github.com/Shougo/dein.vim')
  if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
      call system('git clone https://github.com/Shougo/dein.vim '.shellescape(s:dein_repo_dir))
    endif
    execute 'set runtimepath^='.s:dein_repo_dir
  endif

  "set runtimepath+=s:dein_repo_dir
  "let s:dein_dir = 'dein_list'
  if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    call dein#add(s:dein_repo_dir)

    call dein#load_toml('~/initfiles/dein_list/common.toml',      {'lazy': 0})
    call dein#load_toml('~/initfiles/dein_list/common_lazy.toml', {'lazy': 1})
    if has('nvim')
      call dein#load_toml('~/initfiles/dein_list/nvim.toml',      {'lazy': 0})
      call dein#load_toml('~/initfiles/dein_list/nvim_lazy.toml', {'lazy': 1})
    elseif has('gui')
      call dein#load_toml('~/initfiles/dein_list/gvim.toml',      {'lazy': 0})
      call dein#load_toml('~/initfiles/dein_list/gvim_lazy.toml', {'lazy': 1})
    endif
    call dein#end()
    call dein#save_state()
  endif

  filetype plugin indent on
  syntax enable
endif
let g:dein_loaded = 1

if filereadable(expand('$HOME/.config/repos/github.com/tomasr/molokai/colors/molokai.vim'))
  colorscheme molokai
else
  colorscheme slate
endif

"if dein#check_install()
"  call dein#install()
"endif
