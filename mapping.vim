let mapleader = "\<Space>"
" Disable finish vim with ZZ
nnoremap ZZ <Nop>
nnoremap Y y$
nnoremap <Leader>e  :<C-u>/ oldfiles<C-b>browse filter /
" Switch buffer.
map <C-TAB> <ESC>:bp<CR>
map <C-S-TAB> <ESC>:bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>b :ls<CR>:b

nnoremap <silent> <C-L> <ESC>:<C-u>nohlsearch<CR>

" insert timestamp
inoremap <silent> <C-L>tt <C-R>=strftime("%Y.%m.%d %H:%M")<CR>
inoremap <silent> <C-L>t. <C-R>=strftime("%Y.%m.%d %H:%M")<CR>
inoremap <silent> <C-L>t/ <C-R>=strftime("%Y/%m/%d %H:%M")<CR>
inoremap <silent> <C-L>t- <C-R>=strftime("%Y-%m-%d %H:%M")<CR>

nnoremap <leader>T :<C-u>tablast <bar> tabnew <C-e>
