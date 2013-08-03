" Shortcut for searching all files
map <leader>a :Ack!<space>

" Use The Silver Searcher, if it's available
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif
