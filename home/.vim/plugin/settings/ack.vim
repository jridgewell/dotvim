" Shortcut for searching all files
map <leader>a :Ack!<space>''<left>
map <leader>L :LAck!<space>''<left>

if executable('rg')
    let g:ackprg = 'rg --vimgrep'
elseif executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

let g:ack_mappings = {
  \ "s": "<C-W><CR><C-W>K",
  \ "S": "<C-W><CR><C-W>K<C-W>b",
  \ "h": "h",
  \ }
