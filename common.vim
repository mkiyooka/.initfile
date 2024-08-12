if has('osxdarwin')
    let g:os = 'osx'
elseif has('unix')
    let lines = readfile('/proc/version')
    if lines[0] =~ 'Microsoft'
        let g:os = 'wsl'
    elseif has('windows')
        let g:os = 'win-mingw'
    elseif has('linux')
        let g:os = 'linux'
    endif
elseif has('windows') || has('win64') || has('win32')
    let g:os = 'windows'
endif

if g:os == 'windows'
    set runtimepath^=$HOME/.vim
endif

"-------------------------------------------------------------------------------
set visualbell t_vb= "disable beep
set noerrorbells "disable beep

set nobackup
set noundofile

set nocompatible
set scrolloff=0         "Number of lines to display above and below the cursor line
set number              "Show line number
set title               "Show title
set laststatus=2        "Always display the status line.
set cmdheight=1         "Command line height
set ruler               "show ruler (line number:column number)
set showcmd             "Show (partial) command in the last line of the screen.
set list                "Show <tab>, <space>, <eol>, etc.
set listchars=tab:I-,nbsp:.,trail:.,extends:>,precedes:<
set wrap                "Display long line wrapped.
set tabstop=4           "Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4        "Number of spaces to use for each step of (auto)indent.
set softtabstop=4       "Number of spaces that a <Tab> counts for while performing editing operations.
set expandtab           "expandtab: Use spaces instead of insert <Tab>.
set autoindent
set cinoptions+=:0      "Indent with C language
set foldcolumn=1        "fold column width
set foldmethod=syntax
set backspace=indent,eol,start
set ambiwidth=double    "For CJK fonts.
set showmatch matchtime=1 "Tenth of a second to show the matching paren.

set clipboard+=unnamed  "Use clipboard as unnamed register
set hidden              "Disable alert with change from unsaved buffer.
set formatoptions+=mMj
set virtualedit+=block  "Free cursor on visual block mode
set whichwrap=b,s,[,],<,> "the cursor left/right behave on the first/last character in the line.
set wildmenu            "Enhance autocomplete in command line.
"set shellslash          "Use '/' as a path separator in Windows.

set nrformats-=octal    "<C-a> and <C-x> will consider numbers that start with 0 like "007" to be octal.
set timeoutlen=2000     "Time in ms to wait for a key-bind sequence to complete.
set history=1000        "Number of history may be stored. Max: 10000.

set ignorecase          "Ignore case in search patterns.
set smartcase           "Case sensitive search with patterns include upper character.
set incsearch           "Incremental searching
set hlsearch            "Highlight the matching patterns
set wrapscan            "Searches wrap around the end of the file.
set encoding=utf-8
set termencoding=
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932

set conceallevel=0
set concealcursor=n
set cursorline
set cursorlineopt=both
set cursorbind

"-------------------------------------------------------------------------------
"Change cursor color with IME mode.
if has('multi_byte_ime') || has('xim')
    "Cursor color when IME is ON
    highlight Cursor guibg=white guifg=black
    highlight CursorIM guibg=lightred guifg=black
    set iminsert=0 "Default IME mode on insert mode
    set imsearch=0 "Default IME mode on search mode
endif

if g:os == 'osx'
    "for Mac
    set shell=/bin/bash
    set makeprg=make
elseif g:os == 'linux'
    "for Unix
    set shell=/bin/bash
    set makeprg=make
elseif g:os == 'windows'
    if !has('nvim')
        set shell=cmd.exe
        set makeprg=make "or mingw32-make
        set pythonthreedll=python39.dll
    endif
endif

command -bar QfTodo call s:qf_todo()

fu s:qf_todo() abort
    sil vim /@\u\+/gj %
    let curfile = expand('%:p')
    call setqflist([], 'r', #{
                \ lines : getqflist()->map('curfile .. "|" .. v:val.lnum .. " " .. v:val.col .. "|" .. v:val.text'),
                \ efm : '%f|%l %c|%m',
                \ quickfixtextfunc : 's:quickfixtextfunc',
                \ })
    copen
endfu

fu s:quickfixtextfunc(info) abort
    if a:info.quickfix
        let qfl = getqflist(#{id: a:info.id, items: 1}).items
    else
        let qfl = getloclist(a:info.winid, #{id: a:info.id, items: 1}).items
    endif
    let l = []
    for idx in range(a:info.start_idx - 1, a:info.end_idx - 1)
        let e = qfl[idx]
        let fname = bufname(e.bufnr)->fnamemodify(':t')
        let displayed = printf('%s|%d col %d|%s| %s',
                    \ fname,
                    \ e.lnum,
                    \ e.col,
                    \ matchstr(e.text, '@\zs\u\+'),
                    \ e.text
                    \ )
        call add(l, displayed)
    endfor
    call sort(l, function('s:MySort'))
    return l
endfu

fu s:MySort(i, j) abort
    let s1 = split(a:i, '|')[3]
    let s2 = split(a:j, '|')[3]
    return s1 ==# s2 ? 0 : s1 ># s2 ? 1 : -1
endfu

augroup vimrc-local
    autocmd!
    autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
    let files = findfile('.vimrc.local', escape(a:loc, ' \') . ';', -1)
    for i in reverse(filter(files, 'filereadable(v:val)'))
        source `=i`
    endfor
endfunction
