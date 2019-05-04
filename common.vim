let s:gps = expand('$HOME/initfile/get_plugins.vim')
if filereadable(s:gps)
  execute 'source' s:gps
endif


if has('unit')
  "for Unix
  set shell=/bin/bash
  set makeprg=make
endif
if has('mac')
  "for Mac
  set shell=/bin/bash
  set makeprg=make
endif
if has('win32') || has('win64')
  if !has('nvim')
    set shell=cmd.exe
    set makeprg=mingw32-make
  endif
endif

"-------------------------------------------------------------------------------
set visualbell t_vb= "disable beep
set noerrorbells "disable beep

set nobackup
set noundofile

set number              "Show line number
set title               "Show title
set laststatus=2        "Always display the status line.
set cmdheight=1         "Command line height
set ruler               "show ruler (line number:column number)
set showcmd             "Show (partial) command in the last line of the screen.
set list                "Show <tab>, <space>, <eol>, etc.
set listchars=eol:<,tab:I-,nbsp:.,trail:.,extends:>,precedes:<
set wrap                "Display long line wrapped.
set tabstop=4           "Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4        "Number of spaces to use for each step of (auto)indent.
set softtabstop=4       "Number of spaces that a <Tab> counts for while performing editing operations.
set noexpandtab         "expandtab: Use spaces instead of insert <Tab>.
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
set shellslash          "Use '/' as a path separator in Windows.

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

"-------------------------------------------------------------------------------
"Change cursor color with IME mode.
if has('multi_byte_ime') || has('xim')
  "Cursor color when IME is ON
  highlight Cursor guibg=white guifg=black
  highlight CursorIM guibg=lightred guifg=black
  set iminsert=0 "Default IME mode on insert mode
  set imsearch=0 "Default IME mode on search mode
endif

