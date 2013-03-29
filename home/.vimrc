" I don't use vi
set nocompatible

" ================== Vundle Initialization ===================
" This loads all the plugins specified in ~/.vim/vundle.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundle.vim"))
  source ~/.vim/vundle.vim
endif

" ====================== General Config ======================
set showcmd                             " Show commands as you type them
set noshowmode                          " Let Powerline show the mode
set number                              " Show line numbers
set laststatus=2                        " Always show the status bar
set nowrap                              " Don't wrap lines
set cursorline                          " Highlight current line
set hidden                              " Make buffers work right
set spell                               " Spell check...
set visualbell                          " No sounds
set encoding=utf-8                      " Force UTF-8 on files
set list                                " Show certain chars
set listchars=tab:\ \ ,trail:·          " Namely, trailing whitespace


" ======================== Scrolling =========================
set scrolloff=8                         " Show 8 lines above or below current line
set sidescrolloff=15                    " Show 15 columns on either side of current column
set sidescroll=1                        " Side-scroll sensibly beyond the screen
if &term =~ "iPad"
    set sidescroll=5                    " If on iPad, side scroll by 5
endif



" ========================= Keyboard =========================
let mapleader=","                       " Make the leader easier to reach
set backspace=indent,eol,start          " Sensible backspacing
nmap <C-c> <Esc>                        " Map CTRL-C to ESC
map! <C-c> <Esc>                        " Map CTRL-C to ESC


" ======================== Copy/Paste ========================
set clipboard=unnamed                   " Copy/Paste from Mac clipboard
nnoremap <F2> :set paste!<CR>           " Easy pasting without autoindent


" ==================== Window Navigation =====================
nnoremap <C-j> <C-w>j                   " It's exactly what you think it is
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


" ====================== Backups & Undo ======================
silent !mkdir ~/.vim/backup > /dev/null 2>&1
set history=500                         " Remember last 500 commands
if has('persistent_undo')
    set undodir=~/.vim/backup           " Store undo history
    set undofile                        " Same
endif
set backupdir=~/.vim/backup             " Centralized storage of .swap files
set directory=~/.vim/backup             " Same
set viminfo+=n~/.vim/backup/.viminfo    " Store .viminfo in ~/.vim/backup
                                        " Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


" ====================== Tab Completion ======================
set wildmode=list:longest,list:full
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*


" =========================== Tabs ===========================
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set noexpandtab
set expandtab                           " Expand tabs into spaces
set autoindent
set smartindent
set smarttab
set shiftround


" ===================== Per-File Syntax ======================
syntax on
filetype plugin indent on


" ======================== Searching =========================
set hlsearch                            " Highlight all matches of a search
set incsearch                           " Show first match as you type
set ignorecase                          " Ignore case when searching
set smartcase                           " Unless there's a capital letter
nnoremap <silent> <CR> :nohlsearch<CR>  " clear the search buffer when hitting return


" ======================== Splitting =========================
set splitright
set splitbelow


" ========================== Mouse ===========================
if has("mouse")
    set mouse=a
endif


" ========================== Theme ===========================
if &term =~ "256"
    set t_Co=256
    let g:solarized_termcolors=256
else
    set t_Co=16
    let g:solarized_termcolors=16
endif
set background=dark
let g:solarized_termtrans=1
if has('gui_running')
    set guifont=Anonymous\ Pro:h14
endif
colorscheme solarized


" ================== Load Specific Plugins ===================
"for f in split(glob('~/.vim/plugin/settings/*.vim'), '\n')
"    exe 'source' f
"endfor
