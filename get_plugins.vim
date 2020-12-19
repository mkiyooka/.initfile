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
  Plug 'syncmk/molokai'

  "Appearance of vim
  Plug 'itchyny/lightline.vim' " Status line styler

  "Common
  Plug 'airblade/vim-gitgutter'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'kien/ctrlp.vim'
  Plug 'markonm/traces.vim' "This plugin highlits patterns and ranges for Ex commands
  Plug 'preservim/tagbar' "Help using tags. vim >= 7.3.1058, Exuberant Ctags >= 5.5
  Plug 'scrooloose/nerdtree'
  Plug 'skanehira/translate.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'vim-scripts/mru.vim'
  Plug 'vim-scripts/sudo.vim'

  "For specific languages
  Plug 'sheerun/vim-polyglot' "Language support plugin assortment
  Plug 'ekalinin/Dockerfile.vim', { 'for': ['Dockerfile'] }
  Plug 'mattn/emmet-vim', { 'for': ['html'] }
  Plug 'tpope/vim-markdown', {'for': ['markdown'] }
  Plug 'previm/previm', {'for': ['markdown'] }
  Plug 'mattn/vim-maketable' "Make markdown table
  Plug 'chr4/nginx.vim', { 'for': ['nginx'] }
  Plug 'Vimjas/vim-python-pep8-indent', { 'for': ['python'] }
  Plug 'cespare/vim-toml', { 'for': ['toml'] }

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

if filereadable(s:plug) && filereadable(s:dracula)
  colorscheme dracula
elseif filereadable(s:plug) && filereadable(s:molokai)
  colorscheme molokai
elseif filereadable(s:plug) && filereadable(s:tender)
  colorscheme tender
else
  colorscheme desert
endif

let g:markdown_fenced_languages = ['html', 'css', 'js=javascript', 'c', 'cpp', 'python', 'ruby', 'vim', 'sh', 'bash=sh', 'toml', 'yaml', 'json', 'nginx', 'Dockerfile']
let g:markdown_syntax_conceal = 0
