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
Bundle 'mmalecki/vim-node.js'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'skwp/vim-rspec'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
" Plugins

Bundle 'FelikZ/ctrlp-py-matcher'
Bundle 'Raimondi/delimitMate'
Bundle 'StanAngeloff/php.vim'
Bundle 'bling/vim-airline'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'myusuf3/numbers.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'skwp/vim-easymotion'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/AutoTag.git'
Bundle 'vim-scripts/matchit.zip.git'
