" ----- for markdown -----
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

" ----- vim-markdown-toc -----
let g:vmt_list_item_char = '-'

" ----- for wiki.vim -----
function! WikiRoot() abort
    let l:wiki_local_root = finddir('doc', ';./')
    let l:wiki_global_root = expand('~/GoogleGrive/doc/wiki')
    if !empty(l:wiki_local_root)
        return l:wiki_local_root
    elseif isdirectory(l:wiki_global_root)
        return l:wiki_global_root
    else
        return '~/doc/wiki' " wiki default
    end
endfunction

let g:wiki_root = 'WikiRoot'

let g:wiki_link_extension = '.md'
let g:wiki_link_target_type = 'md' "create markdown type link
let g:wiki_filetypes = ['md', 'adoc', 'wiki']
let g:wiki_month_names = [
            \ '1 January', '2 February', '3 March', '4 April',
            \ '5 May', '6 June', '7 July', '8 August',
            \ '9 September', '10 October', '11 November', '12 December']
"let g:wiki_journal = {
"            \ 'name': 'journal',
"            \ 'frequency': 'daily',
"            \ 'date_format': {
"            \   'daily': '%Y-%m-%d',
"            \   'weekly': '%Y-w%V',
"            \   'monthly': '%Y-m%m',
"            \ },
"            \ }
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
let g:indent_guides_auto_colors = 1
let g:indent_guides_color_change_percent = 4
let g:indent_guides_exclude_filetypes = ['help', 'markdown']

" ----- for lsp -----
let g:lsp_settings = { 'clangd': { 'cmd': ['clangd', '--enable-config', '--clang-tidy'] } }

if executable('clangd')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'clangd',
                \ 'cmd': {server_info->['clangd']},
                \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                \ })
endif

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
autocmd FileType c,cpp,objc map <buffer><Leader>= <Plug>(operator-clang-format)

" for rust
let g:rustfmt_autosave = 1
autocmd FileType rust nnoremap <buffer><Leader>r :<C-u>make run<CR>
autocmd FileType rust nnoremap <buffer><Leader>b :<C-u>make build<CR>
autocmd FileType rust nnoremap <buffer><Leader>t :<C-u>make test<CR>
autocmd FileType rust nnoremap <buffer><Leader>o :<C-u>copen<CR>

let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
    \ 'outputter/buffer/opener': 'new',
    \ 'outputter/buffer/into': 1,
    \ 'outputter/buffer/close_on_empty': 1,
    \ }

augroup quickrun-setting
    autocmd!
    autocmd BufNewFile,BufRead *.crs setf rust
    autocmd BufNewFile,BufRead *.rs  let g:quickrun_config.rust = {
        \'exec' : 'cargo run %o', 'hook/shebang/enable': 0,}
    autocmd BufNewFile,BufRead *.crs let g:quickrun_config.rust = {'exec' : 'cargo script %s -- %a'}
    autocmd BufNewFile,BufRead *.cpp  let g:quickrun_config.cpp = {'command': 'make', 'exec': ['%c'] }
    autocmd FileType quickrun syntax match qrError "\v^error:"
    autocmd FileType quickrun syntax match qrWarning "\v^warning:"
    autocmd FileType quickrun syntax match qrPosition "\v\^+ .+:"
    autocmd FileType quickrun hi link qrError Error
    autocmd FileType quickrun hi qrWarning ctermfg=yellow guifg=#D7B455
    autocmd FileType quickrun hi qrPosition ctermfg=darkcyan guifg=#6C9AE9
augroup END

augroup quickfix-setting
    autocmd!
    autocmd FileType qf syntax match qfError "error"
    autocmd FileType qf syntax match qfWarning "warning"
    autocmd FileType qf hi link qfError Error
    autocmd FileType qf hi qfWarning ctermfg=yellow guifg=#D7B455
augroup END

" ----- for fern -----
nnoremap <leader>f :<c-u>Fern %:h -reveal=% -drawer -toggle<CR>
nnoremap <leader>F :<c-u>Fern . -reveal=% -drawer -toggle<CR>

function! s:fern_settings() abort
    nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
    nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
    nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
    nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
endfunction

augroup fern-settings
    autocmd!
    autocmd FileType fern call s:fern_settings()
    autocmd FileType fern setlocal norelativenumber
    autocmd FileType fern setlocal nonumber
augroup END

" Markdown Preview settings
if has('nvim') || v:version >= 810
    let g:mkdp_auto_start = 0
    let g:mkdp_auto_close = 1
    "the update is reflected immediatly with 0, at save the buffer or leave insert mode with 1
    let g:mkdp_refresh_slow = 0
    let g:mkdp_command_for_global = 0
    let g:mkdp_open_to_the_world = 0
    let g:mkdp_open_ip = ''
    let g:mkdp_browser = ''
    let g:mkdp_echo_preview_url = 1
    let g:mkdp_browserfunc = ''

    let g:mkdp_port = '8765' " empty for random
    let g:mkdp_page_title = '${name}'
    let g:mkdp_filetypes = ['markdown']
    let g:mkdp_theme = 'light' " dark or light
    let g:mkdp_markdown_css = '' " full path or expand('~/markdown.css')
    let g:mkdp_highlight_css = '' " full path or expand('~/highlight.css')

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

    function! s:markdown_preview_scroll_toggle() abort
        let g:mkdp_preview_options.disable_sync_scroll = 1 - g:mkdp_preview_options.disable_sync_scroll
    endfunction

    command MarkdownPreviewScrollToggle call s:markdown_preview_scroll_toggle()
    augroup mkdp-settings
        autocmd! *
        autocmd FileType markdown nnoremap <Leader>s call s:markdown_preview_scroll_toggle()
    augroup END
endif
