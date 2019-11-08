" disable linter for files larger than 100kb
let g:ale_maximum_file_size=1024*100
let g:ale_echo_msg_format = '%linter% says %s'

let g:ale_fixers = {
\   'javascript': ['prettier_eslint', 'prettier', 'eslint'],
\}
