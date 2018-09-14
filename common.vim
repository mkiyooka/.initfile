"------------- dein Scripts --------------
let s:gps = expand('~/initfiles/get_plugins.vim')
if filereadable(s:gps)
  execute 'source' s:gps
endif

let s:rc_mapping = expand('~/initfiles/mapping.vim')
if filereadable(s:rc_mapping)
  execute 'source' s:rc_mapping
endif

set makeprg=mingw32-make

if !has('nvim')
  set shell=cmd.exe
endif

"-------------------------------------------------------------------------------
set clipboard+=unnamed  "use clipboard
set nrformats-=octal    "<C-a> and <C-x> will consider numbers that start with 0 like "007" to be octal.
set timeoutlen=3500     "Time in ms to wait for a key-bind sequence to complete.
set hidden              "編集結果非保存のバッファから、新しいバッファを開くときに警告を出さない
set history=1000        "Number of history may be stored. Max: 10000.

"テキスト挿入中の自動折り返しを日本語に対応させる
"日本語の行の連結時には空白を入力しない
set formatoptions+=mM
set virtualedit+=block  "Visual blockモードでフリーカーソルを有効にする
set whichwrap=b,s,[,],<,> "カーソルキーで行末／行頭の移動可能に設定
set backspace=indent,eol,start
set ambiwidth=double    "□や○の文字があってもカーソル位置がずれないようにする
set wildmenu            "コマンドライン補完するときに強化されたものを使う
set shellslash          "Windowsでディレクトリパスの区切り文字表示に / を使えるようにする
set number              "行番号表示
set notitle             "タイトルを表示
set laststatus=2        "常にステータス行を表示 (詳細は:he laststatus)
set cmdheight=1         "コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set showcmd             "コマンドをステータス行に表示
set display=lastline    "画面最後の行をできる限り表示する
set list                "Tab、行末の半角スペースを明示的に表示する
set listchars=tab:I-,extends:<,eol:<",trail:- " どの文字でタブや改行を表示するかを設定
set tabstop=4           "タブの画面上での幅
set shiftwidth=4        "インデントとかの幅
set noexpandtab         "タブをスペースに展開しない (expandtab:展開する)
set wrap                "長い行を折り返して表示 (nowrap:折り返さない)
"タブを設定
"set ts=4 sw=4 sts=4
set autoindent          "自動的にインデントする
set cinoptions+=:0      "Cインデントの設定
"set showmatch          "括弧の対応表示時間
set showmatch matchtime=1
set ruler               "ルーラーを表示 (noruler:非表示)

set foldcolumn=1        "fold column width
set foldmethod=syntax   "構文強調表示のキーワードを使って指定する．
set ignorecase          "検索の時に大文字小文字を区別しない
set smartcase           "ただし大文字小文字の両方が含まれている場合は区別する
set wrapscan            "検索時にファイルの最後まで行ったら最初に戻る
set incsearch           "インクリメンタルサーチ
set hlsearch            "検索文字の強調表示

set foldcolumn=1 "折り畳みカラム幅の設定

set foldmethod=syntax "構文強調表示のキーワードを使って指定する．
set nobackup
set noundofile
set noswapfile

set visualbell t_vb= "ビープ音を無効化
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない

"-------------------------------------------------------------------------------
"IMEの状態をカラー表示
if has('multi_byte_ime') || has('xim')
  " IME ON時のカーソルの色を設定(設定例:紫)
  highlight Cursor guibg=white guifg=black
  highlight CursorIM guibg=lightred guifg=black
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif


"-------------------------------------------------------------------------------
"全角スペースを表示
highlight ZenkakuSpace cterm=underline ctermfg=Blue gui=underline guifg=Blue
augroup MyAutoCmd
  autocmd!
  autocmd BufRead,BufNew * match ZenkakuSpace /　/
augroup END


"-------------------------------------------------------------------------------
"ステータスラインに文字コード等表示
"iconvが使用可能の場合、カーソル上の文字コードをエンコードに応じた表示にするFencB()を使用
"-------------------------------------------------------------------------------
"ステータスのところにファイル情報表示
if has('iconv')
  set statusline=%<%F\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=[0x%{FencB()}]\ (%v,%l)[%P\]\ %L
else
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 
endif
"FencB() : カーソル上の文字コードをエンコードに応じた表示にする
function! FencB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return s:Byte2hex(s:Str2byte(c))
endfunction
function! FencC()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return s:Byte2num(s:Str2byte(c))
endfunction

function! s:Str2byte(str)
  return map(range(len(a:str)), 'char2nr(a:str[v:val])')
endfunction

function! s:Byte2hex(bytes)
  return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
endfunction

function! s:Byte2num(bytes)
  return join(map(copy(a:bytes), 'printf("%02d", v:val)'), '')
endfunction

"-------------------------------------------------------------------------------
"                                  diff/patch
"-------------------------------------------------------------------------------
"diffの設定
if has('win32') || has('win64')
  set diffexpr=MyDiff()
  function! MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let cmd = '!diff ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    silent execute cmd
  endfunction
endif

"現バッファの差分表示(変更箇所の表示)
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
"ファイルまたはバッファ番号を指定して差分表示。#なら裏バッファと比較
command! -nargs=? -complete=file Diff if '<args>'=='' | browse vertical diffsplit|else| vertical diffsplit <args>|endif
"パッチコマンド
set patchexpr=MyPatch()
function! MyPatch()
   :call system($VIM."\\'.'patch -o " . v:fname_out . " " . v:fname_in . " < " . v:fname_diff)
endfunction

let g:python3_host_prog = 'C:\tools\Anaconda3\python.exe'
