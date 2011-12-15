" Pathogen
"call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Customizations
syntax enable
set number
set ruler
set nowrap
set list listchars=tab:\ \ ,trail:·
set cursorline
set hidden
set spell

" Keyboard
set clipboard=unnamed
set backspace=indent,eol,start
let mapleader=","

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

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

" Show (partial) command in the status line
set showcmd

" Tabs
set tabstop=4
set shiftwidth=4
set noexpandtab

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Use Mouse
if has("mouse")
	set mouse=a
endif

" Theme
set background=light
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
"let g:solarized_degrade=1
"let g:solarized_visibility=high
colorscheme solarized

" Whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
""autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
""autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
""autocmd InsertLeave * match ExtraWhitespace /\s\+$/
""autocmd BufWinLeave * call clearmatches()>
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>


if has("autocmd")
	" In Makefiles, use real tabs, not tabs expanded to spaces
	au FileType make set noexpandtab

	" Make sure all mardown files have the correct filetype set and setup wrapping
	au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

	" Treat JSON files like JavaScript
	au BufNewFile,BufRead *.json set ft=javascript

	" Remember last location in file, but not for commit messages.
	" see :help last-position-jump
	au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
	  \| exe "normal! g`\"" | endif
endif

" provide some context when editing
set scrolloff=3

" don't use Ex mode, use Q for formatting
map Q gq

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

" Textmate Training Wheels
" http://concisionandconcinnity.blogspot.com/2009/07/vim-part-ii-matching-pairs.html
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {<CR><BS>}<Esc>ko
autocmd Syntax html,vim inoremap < <lt>><Left>
" Leave the matching pair
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
inoremap > <c-r>=ClosePair('>')<CR>
" Leave the matching pair for quotes
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
" Enclose selection
vnoremap (	<ESC>`>a)<ESC>`<i(<ESC>
vnoremap )	<ESC>`>a)<ESC>`<i(<ESC>
vnoremap {	<ESC>`>a}<ESC>`<i{<ESC>
vnoremap }	<ESC>`>a}<ESC>`<i{<ESC>
vnoremap "	<ESC>`>a"<ESC>`<i"<ESC>
vnoremap '	<ESC>`>a'<ESC>`<i'<ESC>
vnoremap `	<ESC>`>a`<ESC>`<i`<ESC>
vnoremap [	<ESC>`>a]<ESC>`<i[<ESC>
vnoremap ]	<ESC>`>a]<ESC>`<i[<ESC>
"Delete pair if nothing is between them
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
