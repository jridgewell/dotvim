" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vim-plug plugin manager.
" Once you've updated the list of plugin, you can run vim-plug update by issuing
" the command :PlugInstall from within vim.

call plug#begin()

" vim-plug
Plug 'junegunn/vim-plug'

" Colors
Plug 'skwp/vim-colors-solarized'

" Syntax
Plug 'sheerun/vim-polyglot'

" Fuzzy Finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Plugins
Plug 'Raimondi/delimitMate'
Plug 'chrisbra/matchit'
Plug 'craigemery/vim-autotag'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'mileszs/ack.vim'
Plug 'myusuf3/numbers.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'

" Text Objects
Plug 'austintaylor/vim-indentobject'
Plug 'coderifous/textobj-word-column.vim'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-user'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'vim-scripts/argtextobj.vim'

call plug#end()
