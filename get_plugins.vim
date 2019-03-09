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
Plug 'Vimjas/vim-python-pep8-indent', { 'for': ['python'] }
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim', { 'for': ['html'] }

call plug#end()

colorscheme molokai
