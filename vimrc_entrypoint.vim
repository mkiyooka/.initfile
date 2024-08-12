" --------------- common setting ---------------
if exists('g:vimrc_sourced')
    finish
endif
let g:vimrc_sourced = 1

let s:rc_common = expand('$HOME/.initfile/common.vim')
if filereadable(s:rc_common)
    execute 'source' s:rc_common
endif

let s:rc_mapping = expand('$HOME/.initfile/mapping.vim')
if filereadable(s:rc_mapping)
    execute 'source' s:rc_mapping
endif

let s:rc_terminal = expand('$HOME/.initfile/terminal_setting.vim')
if filereadable(s:rc_terminal)
    execute 'source' s:rc_terminal
endif

" --------------- configuration for plugins ---------------
let s:rc_plugins = expand('$HOME/.initfile/get_plugins.vim')
if filereadable(s:rc_plugins)
    execute 'source' s:rc_plugins
endif

let s:rc_plugin_setting = expand('$HOME/.initfile/plugin_setting.vim')
if filereadable(s:rc_plugin_setting)
    execute 'source' s:rc_plugin_setting
endif

" --------------- configuration for vim with gui ---------------
if !has('gui_running')
    finish
endif
let s:gui_setting = expand('$HOME/.initfile/gui_setting.vim')
if filereadable(s:gui_setting)
    execute 'source' s:gui_setting
endif
