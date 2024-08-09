" ----- tab window -----
" Anywhere SID.
function! s:SID_PREFIX()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
    let s = ''
    for i in range(1, tabpagenr('$'))
        let bufnrs = tabpagebuflist(i)
        let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
        let no = i  " display 0-origin tabpagenr.
        let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
        let title = fnamemodify(bufname(bufnr), ':t')
        let title = '[' . title . ']'
        let s .= '%'.i.'T'
        let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
        let s .= no . ':' . title
        let s .= mod
        let s .= '%#TabLineFill# '
    endfor
    let s .= '%#TabLineFill#%T%=%#TabLine#'
    return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap [Tag] <Nop>
nmap     t     [Tag]
" Tab jump
for n in range(1, 9)
    execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ

" 新規タブでターミナルモードを起動
nnoremap <silent> tt <cmd>terminal<CR>
" 下分割でターミナルモードを起動
nnoremap <silent> tx <cmd>belowright new<CR><cmd>terminal<CR>
if has('nvim')
    autocmd TermOpen * setlocal norelativenumber
    autocmd TermOpen * setlocal nonumber
endif

" ----- terminal -----
"
tnoremap <ESC> <C-\><C-n>
tnoremap <C-W>n       <cmd>new<cr>
tnoremap <C-W><C-N>   <cmd>new<cr>
tnoremap <C-W>q       <cmd>quit<cr>
tnoremap <C-W><C-Q>   <cmd>quit<cr>
tnoremap <C-W>c       <cmd>close<cr>
tnoremap <C-W>o       <cmd>only<cr>
tnoremap <C-W><C-O>   <cmd>only<cr>

tnoremap <C-W><Down>  <cmd>wincmd j<cr>
tnoremap <C-W><C-J>   <cmd>wincmd j<cr>
tnoremap <C-W>j       <cmd>wincmd j<cr>
tnoremap <C-W><Up>    <cmd>wincmd k<cr>
tnoremap <C-W><C-K>   <cmd>wincmd k<cr>
tnoremap <C-W>k       <cmd>wincmd k<cr>
tnoremap <C-W><Left>  <cmd>wincmd h<cr>
tnoremap <C-W><C-H>   <cmd>wincmd h<cr>
tnoremap <C-W><BS>    <cmd>wincmd h<cr>
tnoremap <C-W>h       <cmd>wincmd h<cr>
tnoremap <C-W><Right> <cmd>wincmd l<cr>
tnoremap <C-W><C-L>   <cmd>wincmd l<cr>
tnoremap <C-W>l       <cmd>wincmd l<cr>
tnoremap <C-W>w       <cmd>wincmd w<cr>
tnoremap <C-W><C-W>   <cmd>wincmd w<cr>
tnoremap <C-W>W       <cmd>wincmd W<cr>
tnoremap <C-W>t       <cmd>wincmd t<cr>
tnoremap <C-W><C-T>   <cmd>wincmd t<cr>
tnoremap <C-W>b       <cmd>wincmd b<cr>
tnoremap <C-W><C-B>   <cmd>wincmd b<cr>
tnoremap <C-W>p       <cmd>wincmd p<cr>
tnoremap <C-W><C-P>   <cmd>wincmd p<cr>
tnoremap <C-W>P       <cmd>wincmd P<cr>
tnoremap <C-W>r       <cmd>wincmd r<cr>
tnoremap <C-W><C-R>   <cmd>wincmd r<cr>
tnoremap <C-W>R       <cmd>wincmd R<cr>
tnoremap <C-W>x       <cmd>wincmd x<cr>
tnoremap <C-W><C-X>   <cmd>wincmd x<cr>
tnoremap <C-W>K       <cmd>wincmd K<cr>
tnoremap <C-W>J       <cmd>wincmd J<cr>
tnoremap <C-W>H       <cmd>wincmd H<cr>
tnoremap <C-W>L       <cmd>wincmd L<cr>
tnoremap <C-W>T       <cmd>wincmd T<cr>
tnoremap <C-W>=       <cmd>wincmd =<cr>
tnoremap <C-W>-       <cmd>wincmd -<cr>
tnoremap <C-W>+       <cmd>wincmd +<cr>
tnoremap <C-W>z       <cmd>pclose<cr>
tnoremap <C-W><C-Z>   <cmd>pclose<cr>
