" disable linter for files larger than 100kb
let g:ale_maximum_file_size = 1024 * 100
let g:ale_echo_msg_format = '%linter% says %code: %%s'
let g:ale_completion_enabled = 1

let g:ale_rust_rustfmt_options = '--edition 2021'
" let g:ale_rust_analyzer_config = {
" \   'checkOnSave': { 'command': 'clippy', 'enable': v:true }
" \ }

map <leader>l :ALEFix<CR>
map gd :ALEGoToDefinition<CR>
map gt :ALEGoToTypeDefinition<CR>

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'rust': ['rustfmt'],
\   'typescript': ['prettier', 'eslint'],
\   '*': ['prettier'],
\}


" let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'javascript': ['eslint', 'tsserver'],
\   'rust': ['analyzer'],
\}
