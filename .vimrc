" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set modelines=0

execute pathogen#infect()
syntax on
filetype plugin indent on

highlight TabS term=standout cterm=standout gui=standout
highlight STabs term=standout cterm=standout gui=standout
highlight link LineEndWS Error

