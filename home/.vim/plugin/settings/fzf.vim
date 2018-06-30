" Setup fzf mappings
nnoremap <silent> <leader>t :Files<CR>
nnoremap <silent> <leader>m :Tags<CR>
nnoremap <silent> <leader>b :Buffers<CR>

" Map Command-T to its namesake
if has("gui_running") && has("gui_macvim")
    map <silent> <D-t> :Files<CR>
    map <silent> <D-b> :Tags<CR>
    map <silent> <D-M> :Buffers<CR>
endif

if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --hidden --files --color=never -g "!.git"'
endif
