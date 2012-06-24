" Don't let Command-T take up the entire window
let g:CommandTMaxHeight=20

" Map Command-T to its namesake
if has("gui_running")
    map <D-t> :CommandT<CR>
endif

" Refresh Command-T when vim gains focus or a file is written
if has("autocmd")
    augroup AuCommandTCmd
        autocmd AuCommandTCmd FocusGained * call s:CmdTFlush()
        autocmd AuCommandTCmd BufWritePost * call s:CmdTFlush()
        function! s:CmdTFlush(...)
            if exists(":CommandTFlush") == 2
                CommandTFlush
            endif
        endfunction
    augroup END
endif
