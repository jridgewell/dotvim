" Shortcut for searching all files
map <leader>a :Ack!<space>
map <leader>l :LAck!<space>

if executable('rg')
    let g:ackprg = 'rg --no-heading --color=never --column'
elseif executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif
