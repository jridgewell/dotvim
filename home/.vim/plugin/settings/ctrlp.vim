" Make Ctrl-P appear in Command-T style
let g:ctrlp_map = '<leader>t'
let g:ctrlp_show_hidden = 1
let g:ctrlp_by_filename = 1
nnoremap <silent> <leader>t :CtrlP<CR>
nnoremap <silent> <leader>m :CtrlPBufTag<CR>

" Search buffers
nnoremap <silent> <leader>b :CtrlPBuffer<CR>

" Map Command-T to its namesake
if has("gui_running") && has("gui_macvim")
    map <silent> <D-t> :CtrlP<CR>
    map <silent> <D-b> :CtrlPBuffer<CR>
    map <silent> <D-M> :CtrlPBufTag<CR>
endif


" Use The Silver Searcher, if it's available
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --hidden -g ""'
    let g:ctrlp_use_caching = 0
endif


" Refresh Ctrl-P when vim gains focus or a file is written
if has("autocmd")
    augroup AuCtrlPCmd
        autocmd AuCtrlPCmd FocusGained * call s:CtrlPFlush()
        autocmd AuCtrlPCmd BufWritePost * call s:CtrlPFlush()
        function! s:CtrlPFlush(...)
            if exists(":ClearCtrlPCache") == 2
                ClearCtrlPCache
            endif
        endfunction
    augroup END
endif
