" Some file types should wrap their text
function! s:setupWrapping()
    setlocal wrap
    setlocal linebreak
    setlocal textwidth=72
    setlocal nolist
endfunction

if has("autocmd")
    " In Makefiles, use real tabs, not tabs expanded to spaces
    au FileType make setlocal noexpandtab

    " Make sure all mardown files have the correct filetype set and setup wrapping
    au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

    " Treat JSON files like JavaScript
    au BufNewFile,BufRead *.json set ft=javascript

    " Remember last location in file, but not for commit messages.
    au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g`\"" | endif
endif
