" ----- window, menu and font -----
if has('gui_running') && has('osxdarwin')
    set antialias
endif
" GUI menu bar is not present
set guioptions=

" encode setting for menu
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

" ----- Display ----
function! s:DefaultStyle() abort
    set guifont=Migu_1M:h11
    set guifontwide=Migu_1M:h11
    set columns=80
    set lines=35
    let s:fDemoStyle=0
endfunction
command! -nargs=0 DefaultStyle :call s:DefaultStyle()

" ----- Projector ----
function! s:DemoStyle() abort
    set guifont=Migu_1M:h18
    set guifontwide=Migu_1M:h18
    set columns=100
    set lines=30
    let s:fDemoStyle=1
endfunction
command! -nargs=0 DemoStyle :call s:DemoStyle()

call s:DefaultStyle()
function! s:ToggleDisplayStyle()
    if s:fDemoStyle == 1
        call s:DefaultStyle()
    else
        call s:DemoStyle()
    endif
endfunction
command! -nargs=0 -range ToggleDisplayStyle call s:ToggleDisplayStyle()

nnoremap <C-w><space> <ESC>:<C-u>ToggleDisplayStyle<CR>
highlight SpecialKey    guifg=#333333 guibg=#181D1E gui=italic

