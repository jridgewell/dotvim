" Check for errors when opening a file
let g:syntastic_check_on_open=1
let g:syntastic_javascript_eslint_args="--config .eslintrc"
if has("autocmd")
    augroup AuSyntasticCmd
        autocmd AuSyntasticCmd FileType javascript call s:UpdateJavascriptLinter()
        function! s:UpdateJavascriptLinter()
            if findfile('.eslintrc', '.;') == ''
                let b:syntastic_javascript_checkers = ['eslint']
            endif
        endfunction
    augroup END
endif

