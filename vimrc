" Pathogen
"call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Customizations
set number
set ruler
set nowrap
set list listchars=tab:\ \ ,trail:·
set cursorline
set hidden

" Keyboard Customizations
nnoremap ' `
nnoremap ` '
let mapleader = ","
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Allow custom plugins per filetype
filetype on
filetype plugin on

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Tab completion
set wildmode=list:longest,list:full
set wildignore=*.o,*.obj,.git,*.class,.svn

" Force UTF-8
set encoding=utf-8

" OS X
if has("mac")
	set backspace=indent,eol,start
	set clipboard=unnamed
	set backspace=2
	set guifont=Anonymous\ Pro:h14
endif

" Show (partial) command in the status line
set showcmd

" Tabs
set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set smartindent

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" MacVim
if has("gui_macvim")
	set guioptions=aAce
	let macvim_hig_shift_movement=1
endif

" Use Mouse
if has("mouse")
	set mouse=a
endif

" Remember last location in file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	\| exe "normal g'\"" | endif
endif

" Theme
syntax enable
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
"let g:solarized_degrade=1
"let g:solarized_visibility=high
colorscheme solarized

" Syntastic options
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

function s:setupMarkup()
	call s:setupWrapping()
	"map <buffer> <Leader>p :Hammer<CR>
endfunction

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()
" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" NERDTree configuration
let NERDTreeIgnore=['\~$']
map <Leader>n :NERDTreeToggle<CR>

" Command-T configuration
let g:CommandTMaxHeight=20

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1
