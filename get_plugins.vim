if has('nvim')
    if has('win32') || has('win64')
        let s:plug_install_dir = '$HOME/.local/share/nvim-data/site'
    else
        let s:plug_install_dir = '$HOME/.local/share/nvim/site'
    endif
else
    if has('win32') || has('win64')
        let s:plug_install_dir = '$HOME/.vim'
    else
        let s:plug_install_dir = '$HOME/.vim'
    endif
endif
let s:plug = expand(s:plug_install_dir . '/autoload/plug.vim')

if filereadable(s:plug)
    call plug#begin()
    " Colorscheme
    Plug 'dracula/vim', {'as':'dracula'}
    Plug 'jacoborus/tender.vim'
    Plug 'mkiyooka/molokai'
    if has('nvim')
        Plug 'EdenEast/nightfox.nvim'
    endif

    " Appearance of vim
    " Status line styler
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'itchyny/lightline.vim'

    " Common
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'ctrlpvim/ctrlp.vim'
    "Plug 'mattn/ctrlp-matchfuzzy'
    "let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}

    " This plugin highlights patterns and ranges for Ex commands
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
    Plug 'lambdalisue/fern.vim'
    Plug 'lambdalisue/fern-hijack.vim'
    Plug 'lambdalisue/fern-bookmark.vim'
    Plug 'lambdalisue/fern-git-status.vim'
    Plug 'yuki-yano/fern-preview.vim'
    Plug 'kana/vim-operator-user'

    " For specific languages
    " Language support plugin assortment
    Plug 'sheerun/vim-polyglot'
    Plug 'ekalinin/Dockerfile.vim', { 'for': ['Dockerfile', 'Containerfile'] }
    Plug 'mattn/emmet-vim', { 'for': ['html'] }
    Plug 'tpope/vim-markdown', {'for': ['markdown'] }
    Plug 'mzlogin/vim-markdown-toc', { 'for': ['markdown'] }
    Plug 'previm/previm', {'for': ['markdown'] }
    Plug 'mattn/vim-maketable' "Make markdown table
    if has('nvim')
        Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    endif
    Plug 'chr4/nginx.vim', { 'for': ['nginx'] }
    Plug 'cespare/vim-toml', { 'for': ['toml'] }
    Plug 'lervag/wiki.vim'

    " --- Programming support ---
    " Help maintain consistent coding styles
    Plug 'thinca/vim-quickrun'
    Plug 'editorconfig/editorconfig-vim'
    " Lint/Format
    " Plug 'w0rp/ale' "Asynchronous Lint Engine
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'piec/vim-lsp-clangd'
    Plug 'rust-lang/rust.vim'
    Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp'] }
    Plug 'Vimjas/vim-python-pep8-indent', { 'for': ['python'] }
    Plug 'neomake/neomake'
    Plug 'vim-test/vim-test'
    call plug#end()
endif

" ----- apply colorscheme -----

if exists('g:plug_home')
    let s:nightfox = expand(g:plug_home . '/nightfox.nvim/colors/nightfox.vim')
    let s:molokai  = expand(g:plug_home . '/molokai/colors/molokai.vim')
    let s:dracula  = expand(g:plug_home . '/dracula/colors/dracula.vim')
    let s:tender   = expand(g:plug_home . '/tender.vim/colors/tender.vim')

    if has("nvim") && filereadable(s:nightfox)
        colorscheme nightfox
        let g:colorscheme = 'nightfox'
    elseif has('gui_running') && filereadable(s:dracula)
        let g:dracula_italic = 0
        colorscheme dracula
        let g:colorscheme = 'dracula'
    elseif filereadable(s:molokai)
        colorscheme molokai
        let g:colorscheme = 'molokai'
    elseif filereadable(s:tender)
        colorscheme tender
        let g:colorscheme = 'tender'
    endif
endif
