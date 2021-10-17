" Use Vim settings, rather then Vi settings
" This must be first, because it changes other options as a side effect.
set nocompatible
set modelines=0
let g:use_deoplete=1

source ~/.vim/plug.vim

highlight TabS term=standout cterm=standout gui=standout
highlight STabs term=standout cterm=standout gui=standout
highlight link LineEndWS Error
