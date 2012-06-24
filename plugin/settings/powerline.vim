" Make Powerline Pretty
let g:Powerline_symbols='fancy'
let g:Powerline_colorscheme='solarizedDark'

" Customize which Segments appear
call Pl#Theme#RemoveSegment('filetype')
call Pl#Theme#RemoveSegment('lineinfo')
"call Pl#Theme#RemoveSegment('scrollpercent')
call Pl#Theme#InsertSegment('filetype:filetype', 'after', 'fileencoding')
call Pl#Theme#InsertSegment('buffer:number', 'before', 'scrollpercent')
