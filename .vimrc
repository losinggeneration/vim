" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
	finish
endif

set hidden

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

call pathogen#infect()
call pathogen#helptags()

"set t_Co=256
"colorscheme aldmeris
colorscheme gruvbox

" Check for whitespace damage
let c_space_errors = 1

" Leader for things like NERDCommenter
let mapleader = ","

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
	set nobackup		" do not keep a backup file, use versions instead
else
	set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
"setlocal spell spelllang=en	"Set the spelling locale"

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch

	highlight Normal guibg=black guifg=White
endif

"set formatoptions=crt
"set textwidth=80
"set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set number

highlight TabS term=standout cterm=standout gui=standout
highlight STabs term=standout cterm=standout gui=standout
highlight link LineEndWS Error

map <C-a> \c<space><CR>

" Some code folding options
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=0

" Map for reformatting a file
map <Leader>rf mzgg=G`z<CR>
" Map <Leader>cd to change directories to the directory of the current file
nnoremap <Leader>cd :cd %:p:h<cr>

