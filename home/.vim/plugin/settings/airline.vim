" Make Airline Pretty
let g:airline_theme='solarized'
" let g:airline_solarized_bg='light'

let g:airline_detect_spell=0
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" Customize which Segments appear
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_symbols = {}
let g:airline_symbols.branch = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.colnr = ' '

let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#show_coc_status = 1
