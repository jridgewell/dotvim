" NERDCommenter mappings
if has("gui_running")
   map  <D-/> :NERDCommenterToggle<CR>
   imap <D-/> <Esc>:NERDCommenterToggle<CR>a
else
   map  <leader>/ :NERDCommenterToggle<CR>
   imap <leader>/ <Esc>:NERDCommenterToggle<CR>a
endif
