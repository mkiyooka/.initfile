if has('nvim')
    let s:plug_install_dir = expand('$HOME/.local/share/nvim/site')
else
    if has("win32") || has("win64")
        let s:plug_install_dir = expand('$HOME/.vim')
    else
        let s:plug_install_dir = expand('$HOME/.vim')
    endif
endif
let s:plug = expand(s:plug_install_dir . '/autoload/plug.vim')

if has('nvim')
    let s:plugged_root = expand('$HOME/.local/share/nvim/plugged')
else
    let s:plugged_root = expand('$HOME/.vim/plugged')
endif

if filereadable(s:plug)
    call plug#begin()
    " Colorscheme
    Plug 'dracula/vim', {'as':'dracula'}
    Plug 'jacoborus/tender.vim'
    Plug 'mkiyooka/molokai'
    Plug 'nathanaelkane/vim-indent-guides'
    if has('nvim')
        Plug 'EdenEast/nightfox.nvim'
    endif

    " Appearance of vim
    " Status line styler
    Plug 'itchyny/lightline.vim'

    " Common
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'ctrlpvim/ctrlp.vim'
    "Plug 'mattn/ctrlp-matchfuzzy'
    "let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}

    " This plugin highlits patterns and ranges for Ex commands
    Plug 'markonm/traces.vim'
    " Help using tags. vim >= 7.3.1058, Exuberant Ctags >= 5.5
    Plug 'preservim/tagbar'
    Plug 'scrooloose/nerdtree'
    Plug 'skanehira/translate.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'yegappan/mru'
    Plug 'vim-scripts/sudo.vim'

    " For specific languages
    " Language support plugin assortment
    Plug 'sheerun/vim-polyglot'
    Plug 'ekalinin/Dockerfile.vim', { 'for': ['Dockerfile', 'Containerfile'] }
    Plug 'mattn/emmet-vim', { 'for': ['html'] }
    Plug 'tpope/vim-markdown', {'for': ['markdown'] }
    Plug 'mzlogin/vim-markdown-toc', { 'for': ['markdown'] }
    Plug 'mkiyooka/previm', {'for': ['markdown'] }
    "Plug 'mkiyooka/previm', { 'for': ['markdown'] }
    Plug 'mattn/vim-maketable' "Make markdown table
    if has('nvim')
        Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    endif
    Plug 'chr4/nginx.vim', { 'for': ['nginx'] }
    Plug 'cespare/vim-toml', { 'for': ['toml'] }
    Plug 'lervag/wiki.vim'
    Plug 'lambdalisue/fern.vim'
    Plug 'lambdalisue/fern-hijack.vim'
    Plug 'lambdalisue/fern-bookmark.vim'
    Plug 'lambdalisue/fern-git-status.vim'
    Plug 'yuki-yano/fern-preview.vim'
    Plug 'kana/vim-operator-user'
    " --- Programming support ---
    " Help maintain consistent coding styles
    Plug 'thinca/vim-quickrun'
    Plug 'editorconfig/editorconfig-vim'
    " Lint
    " Plug 'w0rp/ale' "Asynchronous Lint Engine
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'piec/vim-lsp-clangd'
    Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp'] }
    "Plug 'justmao945/vim-clang', { 'for': ['c', 'cpp'] }
    Plug 'Vimjas/vim-python-pep8-indent', { 'for': ['python'] }
    Plug 'neomake/neomake'
    Plug 'vim-test/vim-test'
  call plug#end()
endif

if has('nvim')
  " set to 1, nvim will open the preview window after entering the markdown buffer
  " default: 0
  let g:mkdp_auto_start = 0
  
  " set to 1, the nvim will auto close current preview window when change
  " from markdown buffer to another buffer
  " default: 1
  let g:mkdp_auto_close = 1
  
  " set to 1, the vim will refresh markdown when save the buffer or
  " leave from insert mode, default 0 is auto refresh markdown as you edit or
  " move the cursor
  " default: 0
  let g:mkdp_refresh_slow = 0
  
  " set to 1, the MarkdownPreview command can be use for all files,
  " by default it can be use in markdown file
  " default: 0
  let g:mkdp_command_for_global = 0
  
  " set to 1, preview server available to others in your network
  " by default, the server listens on localhost (127.0.0.1)
  " default: 0
  let g:mkdp_open_to_the_world = 0
  
  " use custom IP to open preview page
  " useful when you work in remote vim and preview on local browser
  " more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
  " default empty
  let g:mkdp_open_ip = ''
  
  " specify browser to open preview page
  " for path with space
  " valid: `/path/with\ space/xxx`
  " invalid: `/path/with\\ space/xxx`
  " default: ''
  let g:mkdp_browser = ''
  
  " set to 1, echo preview page url in command line when open preview page
  " default is 0
  let g:mkdp_echo_preview_url = 0
  
  " a custom vim function name to open preview page
  " this function will receive url as param
  " default is empty
  let g:mkdp_browserfunc = ''
  
  " options for markdown render
  " mkit: markdown-it options for render
  " katex: katex options for math
  " uml: markdown-it-plantuml options
  " maid: mermaid options
  " disable_sync_scroll: if disable sync scroll, default 0
  " sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
  "   middle: mean the cursor position alway show at the middle of the preview page
  "   top: mean the vim top viewport alway show at the top of the preview page
  "   relative: mean the cursor position alway show at the relative positon of the preview page
  " hide_yaml_meta: if hide yaml metadata, default is 1
  " sequence_diagrams: js-sequence-diagrams options
  " content_editable: if enable content editable for preview page, default: v:false
  " disable_filename: if disable filename header for preview page, default: 0
  let g:mkdp_preview_options = {
      \ 'mkit': {},
      \ 'katex': {},
      \ 'uml': {},
      \ 'maid': {},
      \ 'disable_sync_scroll': 0,
      \ 'sync_scroll_type': 'middle',
      \ 'hide_yaml_meta': 1,
      \ 'sequence_diagrams': {},
      \ 'flowchart_diagrams': {},
      \ 'content_editable': v:false,
      \ 'disable_filename': 0,
      \ 'toc': {}
      \ }
  
  " use a custom markdown style must be absolute path
  " like '/Users/username/markdown.css' or expand('~/markdown.css')
  let g:mkdp_markdown_css = ''
  
  " use a custom highlight style must absolute path
  " like '/Users/username/highlight.css' or expand('~/highlight.css')
  let g:mkdp_highlight_css = ''
  
  " use a custom port to start server or empty for random
  let g:mkdp_port = ''
  
  " preview page title
  " ${name} will be replace with the file name
  let g:mkdp_page_title = '「${name}」'
  
  " recognized filetypes
  " these filetypes will have MarkdownPreview... commands
  let g:mkdp_filetypes = ['markdown']
  
  " set default theme (dark or light)
  " By default the theme is define according to the preferences of the system
  let g:mkdp_theme = 'dark'
endif

" apply colorscheme
let s:nightfox = expand(s:plugged_root . '/nightfox.nvim/colors/nightfox.vim')
let s:molokai  = expand(s:plugged_root . '/molokai/colors/molokai.vim')
let s:dracula  = expand(s:plugged_root . '/dracula/colors/dracula.vim')
let s:tender   = expand(s:plugged_root . '/tender.vim/colors/tender.vim')

if has("nvim") && filereadable(s:plug) && filereadable(s:nightfox)
    colorscheme nightfox
    let g:colorscheme = 'nightfox'
elseif has('gui') && filereadable(s:plug) && filereadable(s:dracula)
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
let s:wiki_root = '~/GoogleGrive/doc/wiki'
if isdirectory(s:wiki_root)
    let g:wiki_root = s:wiki_root
else
    let g:wiki_root = '~/doc/wiki'
end
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

" ----- vim-markdown-toc -----
let g:vmt_list_item_char = '-'

" ----- for vim-clang -----
"let g:clang_c_options = "-std=gnu11 -I./CLI11/include"
"let g:clang_cpp_options = "-std=c++11 -stdlib=libc++ -I./CLI11/include"

" ----- for lsp -----

let g:lsp_settings = {
            \ 'clangd': {
            \   'cmd': ['clangd', '--enable-config', '--clang-tidy']
            \ }
            \}

if executable('clangd')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'clangd',
                \ 'cmd': {server_info->['clangd']},
                \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                \ })
endif

" ----- for vim-clang-format -----
"let g:clang_format#style_options = {
"            \ "AccessModifierOffset" : -4,
"            \ "AllowShortIfStatementsOnASingleLine" : "true",
"            \ "AlwaysBreakTemplateDeclarations" : "true",
"            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
autocmd FileType c,cpp,objc map <buffer><Leader>= <Plug>(operator-clang-format)

" for rust
let g:rustfmt_autosave = 1

let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
    \ 'outputter/buffer/opener': 'new',
    \ 'outputter/buffer/into': 1,
    \ 'outputter/buffer/close_on_empty': 1,
    \ }

augroup rust
    autocmd!
    autocmd BufNewFile,BufRead *.crs setf rust
    autocmd BufNewFile,BufRead *.rs  let g:quickrun_config.rust = {
        \'exec' : 'cargo run %o', 'hook/shebang/enable': 0,}
    autocmd BufNewFile,BufRead *.crs let g:quickrun_config.rust = {'exec' : 'cargo script %s -- %a'}
augroup END
augroup cpp
    autocmd!
    autocmd BufNewFile,BufRead *.cpp  let g:quickrun_config.cpp = {'command': 'make', 'exec': ['%c'] }
augroup END

augroup quickrun
    autocmd!
    autocmd FileType quickrun syntax match qrError "\v^error:"
    autocmd FileType quickrun syntax match qrWarning "\v^warning:"
    autocmd FileType quickrun syntax match qrPosition "\v\^+ .+:"
    autocmd FileType quickrun hi link qrError Error
    autocmd FileType quickrun hi qrWarning ctermfg=yellow guifg=#D7B455
    autocmd FileType quickrun hi qrPosition ctermfg=darkcyan guifg=#6C9AE9
augroup END
