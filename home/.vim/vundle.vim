" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the 
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall

" Filetype off is required by vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle
Bundle 'gmarik/vundle'

" Colors
Bundle 'skwp/vim-colors-solarized'

" Syntax
Bundle 'sheerun/vim-polyglot'

" Plugins
" Bundle 'FelikZ/ctrlp-py-matcher'
Bundle 'Raimondi/delimitMate'
Bundle 'craigemery/vim-autotag'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'easymotion/vim-easymotion'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'mileszs/ack.vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
" Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'vim-scripts/matchit.zip.git'
Bundle 'w0rp/ale'

" Text Objects
Bundle 'austintaylor/vim-indentobject'
Bundle 'coderifous/textobj-word-column.vim'
Bundle 'kana/vim-textobj-entire'
Bundle 'kana/vim-textobj-function'
Bundle 'kana/vim-textobj-user'
Bundle 'thinca/vim-textobj-function-javascript'
Bundle 'vim-scripts/argtextobj.vim'
