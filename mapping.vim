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

