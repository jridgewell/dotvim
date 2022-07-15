" disable linter for files larger than 100kb
let g:LargeFile = 1024 * 100
augroup LargeFile
 autocmd Filetype * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
 " no syntax highlighting
 " setlocal syntax=OFF

 " save memory when other file is viewed
 setlocal bufhidden=unload

 " set readonly
 " setlocal buftype=nowrite

 " disable undo
 " setlocal undolevels=-1

 " Disable syntax highlighting on long lines
 set synmaxcol=300
endfunction
