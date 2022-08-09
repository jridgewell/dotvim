.vim
====

My precious .vim files

## Install
First, install [homesick](https://github.com/technicalpickles/homesick). Then 

    $ homesick clone jridgewell/dotvim
    $ homesick symlink jridgewell/dotvim
    $ vim +PlugInstall +qall

To handle code completion, install the relevant [coc.nvim](https://github.com/neoclide/coc.nvim) extension:

    $ vim "+CocInstall coc-json coc-tsserver coc-rust-analyzer" +qall
