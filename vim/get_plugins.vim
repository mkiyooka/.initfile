if has('nvim')
    if has('win32') || has('win64')
        let s:plug_install_dir = '$HOME/.local/share/nvim/site/'
    else
        let s:plug_install_dir = '$HOME/.local/share/nvim/site/'
    endif
else
    if has('win32') || has('win64')
        let s:plug_install_dir = '$HOME/.vim/'
    else
        let s:plug_install_dir = '$HOME/.vim/'
    endif
endif
let s:plug = expand(s:plug_install_dir . 'autoload/plug.vim')

if filereadable(s:plug)
    call plug#begin()
    " Colorscheme
    Plug 'dracula/vim', {'as':'dracula'}
    Plug 'jacoborus/tender.vim'
    Plug 'mkiyooka/molokai'
    if has('nvim-0.4')
        Plug 'EdenEast/nightfox.nvim'
    endif

    " Appearance of vim
    " Status line styler
    if has('nvim') || v:version >= 810
        Plug 'nathanaelkane/vim-indent-guides'
    endif
    Plug 'itchyny/lightline.vim'

    " File handling
    if has('nvim-0.4.4') || v:version >= 820
        Plug 'lambdalisue/fern.vim'
        Plug 'lambdalisue/fern-hijack.vim'
        Plug 'lambdalisue/fern-bookmark.vim'
        Plug 'lambdalisue/fern-git-status.vim'
        Plug 'yuki-yano/fern-preview.vim'
    endif
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'mattn/ctrlp-matchfuzzy'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-easy-align'

    Plug 'airblade/vim-gitgutter'

    " This plugin highlights patterns and ranges for Ex commands
    Plug 'markonm/traces.vim'
    " Help using tags. vim >= 7.3.1058, Exuberant Ctags >= 5.5
    Plug 'preservim/tagbar'
    Plug 'skanehira/translate.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'yegappan/mru'
    Plug 'vim-scripts/sudo.vim'
    Plug 'kana/vim-operator-user'

    " For Languages
    " complex syntax analysis for highlight
    if has('nvim')
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    endif
    " Language support plugin assortment
    Plug 'editorconfig/editorconfig-vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'ekalinin/Dockerfile.vim', { 'for': ['Dockerfile', 'Containerfile'] }
    Plug 'mattn/emmet-vim', { 'for': ['html'] }
    Plug 'mzlogin/vim-markdown-toc', { 'for': ['markdown'] }
    Plug 'mattn/vim-maketable' "Make markdown table
    if has('nvim') || v:version >= 810
        Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    endif
    if has('nvim-0.4') || v:version >= 810
        Plug 'lervag/wiki.vim'
    endif

    " --- Programming support ---
    " Help maintain consistent coding styles
    Plug 'thinca/vim-quickrun'
    " Lint/Format
    Plug 'prabirshrestha/vim-lsp'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    if has('nvim-0.4') || v:version >= 810
        Plug 'prabirshrestha/vim-lsp'
        Plug 'prabirshrestha/asyncomplete.vim'
        Plug 'prabirshrestha/asyncomplete-lsp.vim'
    endif
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

    if has('nvim') && filereadable(s:nightfox)
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

