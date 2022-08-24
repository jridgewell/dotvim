" Double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<CR>
map <leader>ee :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%

" Copy the current filename
map <leader>cf :!echo -n % \| pbcopy<CR><CR>

" make Y behave like D and C
map Y y$

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Use :w!! to write to a file using sudo
cmap w!! %!sudo tee > /dev/null %

" Quick macro execution
nnoremap Q @q;
vnoremap Q :normal @q;

nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>

" Search for selected text without regex magic.
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
