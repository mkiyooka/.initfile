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
