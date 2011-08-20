" Pathogen
"call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Customizations
set number
set ruler
set nowrap
set list listchars=tab:\ \ ,trail:·
"highlight RedundantSpaces ctermbg=red guibg=red
"match RedundantSpaces \+\ze\t/
set cursorline
set hidden
set spell

" Keyboard Customizations
vmap <D-]> >gv
vmap <D-[> <gv
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
	set laststatus=2
endif

" Show (partial) command in the status line
set showcmd

" Tabs
set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set smartindent
set noet

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
nmap <silent> <C-N> :let @/=""<CR>

" MacVim
if has("gui_macvim")
	set guioptions=Ace
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

function! s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=80
endf

function! s:setupMarkup()
	call s:setupWrapping()
	"map <buffer> <Leader>p :Hammer<CR>
endf

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()
" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" NERDTree configuration
let NERDTreeDirArrows=1
let NERDTreeIgnore=['\~$', '\.DS_Store']
let NERDTreeChDirMode=2
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen = 0
map <Leader>n :NERDTreeToggle<CR>:NERDTreeFind<CR>
nnoremap <Leader>d :let NERDTreeQuitOnOpen = 1<bar>NERDTreeToggle<CR>
nnoremap <Leader>D :let NERDTreeQuitOnOpen = 0<bar>NERDTreeToggle<CR>
autocmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
autocmd FocusGained * call s:UpdateNERDTree()
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
" If the parameter is a directory, cd into it
function! s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)
  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif
  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0 
    return
  endif
  if directory
    NERDTree
    wincmd p
    bd
  endif
  if explicitDirectory
    wincmd p
  endif
endfunction

" Command-T configuration
let g:CommandTMaxHeight=20

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Indenting remaps
vnoremap > >gv
vnoremap < <gv

" Textmate Training Wheels
"
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {<CR><BS>}<Esc>ko
autocmd Syntax html,vim inoremap < <lt>><Left>
"
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
"
function! QuoteDelim(char)
	let line = getline('.')
	let col = col('.')
	if line[col - 2] == "\\"
		"Inserting a quoted quotation mark into the string
		return a:char
	elseif line[col - 1] == a:char
		"Escaping out of the string
		return "\<Right>"
	else
		"Starting a string
		return a:char.a:char."\<Left>"
	endif
endf
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>
"
vnoremap (  <ESC>`>a)<ESC>`<i(<ESC>
vnoremap )  <ESC>`>a)<ESC>`<i(<ESC>
vnoremap {  <ESC>`>a}<ESC>`<i{<ESC>
vnoremap }  <ESC>`>a}<ESC>`<i{<ESC>
vnoremap "  <ESC>`>a"<ESC>`<i"<ESC>
vnoremap '  <ESC>`>a'<ESC>`<i'<ESC>
vnoremap `  <ESC>`>a`<ESC>`<i`<ESC>
vnoremap [  <ESC>`>a]<ESC>`<i[<ESC>
vnoremap ]  <ESC>`>a]<ESC>`<i[<ESC>
"
function! InAnEmptyPair()
	let cur = strpart(getline('.'),getpos('.')[2]-2,2)
	for pair in (split(&matchpairs,',') + ['":"',"':'"])
		if cur == join(split(pair,':'),'')
			return 1
		endif
	endfor
	return 0
endf
func! DeleteEmptyPairs()
	if InAnEmptyPair()
		return "\<Left>\<Del>\<Del>"
	else
		return "\<BS>"
	endif
endfunc
inoremap <expr> <BS> DeleteEmptyPairs()
