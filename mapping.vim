let mapleader = "\<Space>"
nnoremap <Leader>e  :<C-u>/ oldfiles<C-b>browse filter /
"Disable finish vim with ZZ
nnoremap ZZ <Nop>
" Move to a previous/next buffer.
map <C-TAB> <ESC>:bp<CR>
map <C-S-TAB> <ESC>:bn<CR>

nnoremap <silent> <C-l> <ESC>:<C-u>nohlsearch<CR>
" insert timestamp
inoremap <silent> <C-T><C-T> <C-R>=strftime("%Y.%m.%d %H:%M")<CR>
nnoremap Y y$

function! SetRelativeNumber()
  set relativenumber
  let g:isRelativeNumber=1
endfunction

function! NoSetRelativeNumber()
  set norelativenumber
  let g:isRelativeNumber=0
endfunction

let g:isRelativeNumber=0
function! ToggleSetRelativeNumber()
  if g:isRelativeNumber
    call NoSetRelativeNumber()
  else
    call SetRelativeNumber()
  endif
endfunction

nnoremap <Leader>nr :call ToggleSetRelativeNumber()<CR>

function! EnableCursorLC()
  set cursorline
  set cursorcolumn
  highlight CurosrLine gui=underline guisp=#000000 guibg=NONE
  highlight CurosrColumn guibg=#000000 guifg=#999999
  highlight Special gui=bold
  let s:fCursorLC = 1
endfunction
command! EnableCursorLC :call EnableCursorLC()

function! DisableCursorLC()
  set nocursorline
  set nocursorcolumn
  let s:fCursorLC = 0
endfunction
command! DisableCursorLC :call DisableCursorLC()

call DisableCursorLC()

command! -nargs=* -range ToggleCursorLC call ToggleCursorLC()
function! ToggleCursorLC()
  if s:fCursorLC == 1
    call DisableCursorLC()
  else
    call EnableCursorLC()
  endif
endfunction

" ------------------------------------------------------------
"  通常作業用スタイル
" ------------------------------------------------------------
function! DefaultStyle()
  set guifont=Migu_1M:h11:cSHIFTJIS
  set guifontwide=Migu_1M:h11:cSHIFTJIS
  "set linespace=3
  set antialias
  set columns=110
  set lines=50
  let s:fDemoStyle = 0
endfunction
command! DefaultStyle :call DefaultStyle()

" ------------------------------------------------------------
"  デモ用スタイル
" ------------------------------------------------------------
function! DemoStyle()
  set guifont=Migu_1M:h18:cSHIFTJIS
  set guifontwide=Migu_1M:h18:cSHIFTJIS
  set columns=100
  set lines=30
  let s:fDemoStyle = 1
endfunction
command! DemoStyle :call DemoStyle()

" ------------------------------------------------------------
"  表示スタイル切り替え
" ------------------------------------------------------------
call DefaultStyle()

command! -nargs=* -range ToggleDisplayStyle call ToggleDisplayStyle()
function! ToggleDisplayStyle()
  if s:fDemoStyle == 1
    call DefaultStyle()
    call EnableCursorLC()
  else
    call DemoStyle()
    call DisableCursorLC()
  endif
endfunction

nnoremap <C-w><Space> <ESC>:<C-u>ToggleDisplayStyle<CR>
highlight SpecialKey guifg=#333333 guibg=#1B1D1E gui=italic
