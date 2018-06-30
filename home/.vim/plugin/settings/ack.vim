" Shortcut for searching all files
map <leader>a :Ack!<space>
map <leader>l :LAck!<space>

if executable('rg')
    let g:ackprg = 'rg --vimgrep'
elseif executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
