let mapleader = "\<Space>"
nnoremap <Leader>e  :<C-u>/ oldfiles<C-b>browse filter /
"Disable finish vim with ZZ強制全保存終了を無効化
nnoremap ZZ <Nop>
" Move to a previous/next buffer.
map <C-TAB> <ESC>:bp<CR>
map <C-S-TAB> <ESC>:bn<CR>

"Stop highlight search
nnoremap <silent> <C-l> <ESC>:<C-u>nohlsearch<CR>
" This insert timestamp
inoremap <silent> <C-T><C-T> <C-R>=strftime("%Y.%m.%d %H:%M")<CR>
" <S-y> yank the characters under the cursor until the end of the line.
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

"ブックマークを初期表示
let g:NERDTreeShowBookmarks=1
"起動時にNERDTreeを表示
"autocmd vimenter * NERDTree
map <C-Space> :NERDTreeToggle<CR>
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')
set shell="bash"
