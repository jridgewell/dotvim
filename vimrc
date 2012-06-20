" Pathogen
call pathogen#infect('colors')
call pathogen#infect('syntax')
call pathogen#infect('bundle')
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

" Customizations
set nocompatible	" I don't use vi
set number				" Show line numbers
set ruler					" Show line/column in status
set nowrap				" Don't wrap lines
set list listchars=tab:\ \ ,trail:· "show tabs and trailing spaces
set laststatus=2	" always show the status bar
set cursorline		" Highlight current line
set hidden				" Make buffers work right
set spell					" Spell check...
set scrolloff=8		" provide some context when editing
set sidescrolloff=15
set sidescroll=1
set visualbell		" No sounds

" Keyboard
let mapleader=","
set backspace=indent,eol,start
nmap <C-c> <Esc>
map! <C-c> <Esc>

" copy/paste
set clipboard=unnamed
"set pastetoggle=<F2> "see https://github.com/Lokaltog/vim-powerline/issues/103
nnoremap <F2> :set paste!<cr>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Allow filetype extras
syntax on
filetype plugin indent on

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem	" Disable output and VCS files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz							" Disable archive files
set wildignore+=*.swp,*~,._*																				" Disable temp and backup files

" Force UTF-8
set encoding=utf-8

let g:Powerline_symbols='fancy'
"let g:Powerline_colorscheme='solarizedDark'
let g:Powerline_colorscheme='solarizedDark'
call Pl#Theme#RemoveSegment('filetype')
call Pl#Theme#RemoveSegment('lineinfo')
"call Pl#Theme#RemoveSegment('scrollpercent')
call Pl#Theme#InsertSegment('filetype:filetype', 'after', 'fileencoding')
call Pl#Theme#InsertSegment('buffer:number', 'before', 'scrollpercent')


" Tabs
set tabstop=2
set shiftwidth=2
set noexpandtab
set autoindent
set smartindent
set smarttab

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
:nnoremap <CR> :nohlsearch<cr>	" clear the search buffer when hitting return

" [v]split in the good directions
set splitright
set splitbelow

" Use Mouse
if has("mouse")
	set mouse=a
endif

" Theme
set t_Co=256					"tell the term has 256 colors"
set background=dark
colorscheme solarized
set guifont=Anonymous\ Pro\ for\ Powerline:13
if has("gui_running")
	" Disable the scrollbars (NERDTree)
	set guioptions-=r
	set guioptions-=L
	" Disable the macvim toolbar
	set guioptions-=T"
endif

" Whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd Syntax * syn match ExtraWhitespace /\s\+\%#\@<!$\| \+\ze\t/
nmap <leader>fef ggVG= " format the entire file


" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Some file types should wrap their text
function! s:setupWrapping()
	set wrap
	set linebreak
	set textwidth=72
	set nolist
endfunction

if has("autocmd")
	" In Makefiles, use real tabs, not tabs expanded to spaces
	au FileType make set noexpandtab

	" Set the Ruby filetype for a number of common Ruby files without .rb
	au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,config.ru,*.rake} set ft=ruby

	" Make sure all mardown files have the correct filetype set and setup wrapping
	au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

	" Treat JSON files like JavaScript
	au BufNewFile,BufRead *.json set ft=javascript

	" Remember last location in file, but not for commit messages.
	au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
				\| exe "normal! g`\"" | endif
endif

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>


" CommandT
map <leader>t :CommandT<cr>
let g:CommandTMaxHeight=20
autocmd FocusGained * call s:CmdTFlush()
autocmd BufWritePost * call s:CmdTFlush()
function s:CmdTFlush(...)
	if exists(":CommandTFlush") == 2
		CommandTFlush
	endif
endfunction


" NERDTree
map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeHijackNetrw=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=1
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
let g:NERDTreeChDirMode=1
augroup AuNERDTreeCmd
	autocmd AuNERDTreeCmd FocusGained * call s:UpdateNERDTree()
	" NERDTree utility function
	function s:UpdateNERDTree(...)
		let stay=0
		if(exists("a:1"))
			let stay=a:1
		end
		if exists("t:NERDTreeBufName")
			let nr=bufwinnr(t:NERDTreeBufName)
			if nr != -1
				exe nr . "wincmd w"
				exe substitute(mapcheck("R"), "<CR>", "", "")
				if !stay
					wincmd p
				end
			endif
		endif
	endif
endfunction
augroup END
" Supertab
let g:SuperTabMappingTabLiteral='<leader><tab>'

" Syntastic
let g:syntastic_check_on_open=1

" Indent Guides
let g:indent_guides_start_level=2
"let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

" Ack
map <leader>a :Ack<space>-a<space>

" Make TAB characters appear like normal.
" This must appear after the THEME settings
hi SpecialKey term=NONE cterm=NONE ctermfg=12 ctermbg=8
