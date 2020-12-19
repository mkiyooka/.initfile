" -----
" Display
" -----
function! DefaultStyle()
  set guifont=Migu_1M:h11:cSHIFTJIS
  set guifontwide=Migu_1M:h11:cSHIFTJIS
  set antialias
  set columns=80
  set lines=35
  let s:fDemoStyle=0
endfunction
:command! DefaultStyle :call DefaultStyle()

" -----
" Projector
" -----
function! DemoStyle()
  set guifont=Migu_1M:h18:cSHIFTJIS
  set guifontwide=Migu_1M:h18:cSHIFTJIS
  set antialias
  set columns=100
  set lines=30
  let s:fDemoStyle=1
endfunction
:command! DemoStyle :call DemoStyle()

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

nnoremap <C-w><space> <ESC>:<C-u>ToggleDisplayStyle<CR>
highlight SpecialKey    guifg=#333333 guibg=#181D1E gui=italic
