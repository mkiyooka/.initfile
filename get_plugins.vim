if has('nvim')
  let s:plug = expand('$HOME/.local/share/nvim/site/autoload/plug.vim')
else
  let s:plug = expand('$HOME/.vim/autoload/plug.vim')
endif

if filereadable(s:plug)

  call plug#begin()
  Plug 'tomasr/molokai'
  Plug 'jacoborus/tender.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'kien/ctrlp.vim'
  Plug 'vim-scripts/mru.vim'
  Plug 'editorconfig/editorconfig-vim'

  Plug 'cespare/vim-toml', { 'for': ['toml'] }
  Plug 'mattn/emmet-vim', { 'for': ['html'] }
  Plug 'ekalinin/Dockerfile.vim', { 'for': ['Dockerfile'] }
  Plug 'chr4/nginx.vim', { 'for': ['nginx'] }
  Plug 'tpope/vim-markdown', {'for': ['markdown'] }
  Plug 'Vimjas/vim-python-pep8-indent', { 'for': ['python'] }
  Plug 'w0rp/ale'
  call plug#end()
endif

if has('nvim')
  let s:molokai = expand('$XDG_CONFIG_HOME/nvim/plugged/molokai/colors/molokai.vim')
else
  let s:molokai = expand('$HOME/.vim/plugged/molokai/colors/molokai.vim')
endif

if filereadable(s:molokai)
  colorscheme molokai
endif
let g:markdown_fenced_languages = ['html', 'css', 'js=javascript', 'c', 'cpp', 'python', 'ruby', 'vim', 'sh', 'bash=sh', 'toml', 'yaml', 'json', 'nginx', 'Dockerfile']
