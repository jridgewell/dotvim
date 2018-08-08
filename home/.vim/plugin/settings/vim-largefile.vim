" disable linter for files larger than 500kb
let g:LargeFile = 1024 * 500
augroup LargeFile
 autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
 " no syntax highlighting etc
 set eventignore+=FileType
 " save memory when other file is viewed
 setlocal bufhidden=unload
 " set readonly
 setlocal buftype=nowrite
 " disable undo
 setlocal undolevels=-1
endfunction
