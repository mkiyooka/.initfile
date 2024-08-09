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

function! ToggleCursorLC()
    if s:fCursorLC == 1
        call DisableCursorLC()
    else
        call EnableCursorLC()
    endif
endfunction
command! -nargs=* -range ToggleCursorLC call ToggleCursorLC()

function! ToggleConceal()
    if ( &conceallevel < 1)
        set conceallevel=3
        set concealcursor=n
    elseif ( &conceallevel > 0)
        set conceallevel=0
        set concealcursor=
    endif
endfunction
command! -nargs=* -range ToggleConceal call ToggleConceal()
nnoremap <Leader>c :<c-u>ToggleConceal<CR>

