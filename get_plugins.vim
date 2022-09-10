if has('nvim')
  let s:plug = expand('$HOME/.local/share/nvim/site/autoload/plug.vim')
else
  if has("win32") || has("win64")
    let s:plug = expand('$HOME/.vim/autoload/plug.vim')
  else
    let s:plug = expand('$HOME/.vim/autoload/plug.vim')
  endif
endif

if filereadable(s:plug)
  call plug#begin()
  "Colorscheme
  Plug 'dracula/vim', {'as':'dracula'}
  Plug 'jacoborus/tender.vim'
  Plug 'mkiyooka/molokai'
  Plug 'nathanaelkane/vim-indent-guides'

  "Appearance of vim
  Plug 'itchyny/lightline.vim' " Status line styler

  "Common
  Plug 'airblade/vim-gitgutter'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'ctrlpvim/ctrlp.vim'
  "Plug 'mattn/ctrlp-matchfuzzy'
  "let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}
  Plug 'markonm/traces.vim' "This plugin highlits patterns and ranges for Ex commands
  Plug 'preservim/tagbar' "Help using tags. vim >= 7.3.1058, Exuberant Ctags >= 5.5
  Plug 'skanehira/translate.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'yegappan/mru'
  Plug 'vim-scripts/sudo.vim'

  "For specific languages
  Plug 'sheerun/vim-polyglot' "Language support plugin assortment
  Plug 'ekalinin/Dockerfile.vim', { 'for': ['Dockerfile'] }
  Plug 'mattn/emmet-vim', { 'for': ['html'] }
  Plug 'tpope/vim-markdown', {'for': ['markdown'] }
  Plug 'mkiyooka/previm', {'for': ['markdown'] }
  Plug 'mattn/vim-maketable' "Make markdown table
  Plug 'chr4/nginx.vim', { 'for': ['nginx'] }
  Plug 'Vimjas/vim-python-pep8-indent', { 'for': ['python'] }
  Plug 'cespare/vim-toml', { 'for': ['toml'] }
  Plug 'lervag/wiki.vim'
  Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/fern-hijack.vim'
  Plug 'lambdalisue/fern-bookmark.vim'
  Plug 'lambdalisue/fern-git-status.vim'
  Plug 'yuki-yano/fern-preview.vim'

  "Programming support
  Plug 'editorconfig/editorconfig-vim' "Help maintain consistent coding styles
  Plug 'w0rp/ale' "Asynchronous Lint Engine
  call plug#end()
endif

if has("win32") || has("win64")
  let s:molokai = expand('$HOME/.vim/plugged/molokai/colors/molokai.vim')
  let s:dracula = expand('$HOME/.vim/plugged/dracula/colors/dracula.vim')
  let s:tender  = expand('$HOME/.vim/plugged/tender.vim/colors/tender.vim')
else
  let s:molokai = expand('$HOME/.vim/plugged/molokai/colors/molokai.vim')
  let s:dracula = expand('$HOME/.vim/plugged/dracula/colors/dracula.vim')
  let s:tender  = expand('$HOME/.vim/plugged/tender.vim/colors/tender.vim')
endif

if has('gui') && filereadable(s:plug) && filereadable(s:dracula)
  let g:dracula_italic = 0
  colorscheme dracula
  let g:colorscheme = 'dracula'
elseif filereadable(s:plug) && filereadable(s:molokai)
  colorscheme molokai
  let g:colorscheme = 'molokai'
elseif filereadable(s:plug) && filereadable(s:tender)
  colorscheme tender
  let g:colorscheme = 'tender'
endif

" ===== for markdown =====
let g:vim_markdown_fenced_languages = [
            \ 'html', 'css', 'js=javascript', 'ts=typescript',
            \ 'c', 'cpp', 'java',
            \ 'python', 'ruby',
            \ 'vim', 'sh', 'bash=sh',
            \ 'toml', 'yaml', 'json', 'ini',
            \ 'nginx', 'Dockerfile']
let g:vim_markdown_conceal = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_auto_extension_ext = 'md'

" ----- for markdown . markdown extention -----
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1

" ----- for previm -----
if has('unix')
elseif has('mac')
  let g:previm_open_cmd = 'open -a Google\ Chrome'
elseif has('win32') || has('win64')
  let g:previm_open_cmd = 'C:\\Program\ Files\ (x86)\\Google\\Chrome\\Application\\chrome.exe'
endif
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mkd} set filetype=markdown
augroup END

" ----- for wiki.vim -----
let g:wiki_root = '~/GoogleGrive/doc/wiki'
let g:wiki_link_extension = '.md'
let g:wiki_link_target_type = 'md' "create markdown type link
let g:wiki_filetypes = ['md', 'adoc', 'wiki']
let g:wiki_month_names = [
            \ '1 January', '2 February', '3 March', '4 April',
            \ '5 May', '6 June', '7 July', '8 August',
            \ '9 September', '10 October', '11 November', '12 December']
let g:wiki_journal = {
            \ 'name': 'journal',
            \ 'frequency': 'daily',
            \ 'date_format': {
            \   'daily': '%Y-%m-%d',
            \   'weekly': '%Y-w%V',
            \   'monthly': '%Y-m%m',
            \ },
            \ }

let g:wiki_tag_scan_num_lines = 3

let g:wiki_tag_parsers = [
            \ g:wiki#tags#default_parser,
            \ { 'match': {x -> x =~# '^tags: '},
            \   'parse': {x -> split(matchstr(x, '^tags:\zs.*'), '[, ]\+')}}
            \]

augroup Wiki
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mkd} nmap <leader><CR> <Plug>(wiki-link-open)
augroup END

" ----- for mru.vim -----
let MRU_File = expand('$HOME/.vim_mru_files')
let MRU_Max_Entries = 1000
highlight link MRUFileName LineNr
let MRU_FuzzyMatch = 1

let MRU_Filename_Format = {
            \ 'formatter': 'fnamemodify(v:val, ":t") . " (" . v:val . ")"',
            \ 'parser': '(\zs.*\ze)',
            \ 'syntax': '^.\{-}\ze('
            \}

" ----- for vim-indent-guides -----
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_exclude_filetypes = ['help', 'markdown']
"let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#333231
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3f3e3e

