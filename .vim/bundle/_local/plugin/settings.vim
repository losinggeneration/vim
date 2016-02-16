" Check for whitespace damage
let c_space_errors = 1

" Leader for things like NERDCommenter
let mapleader = ","

set shiftwidth=4
set softtabstop=4
set tabstop=4
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set number
set backup     " keep a backup file
set history=500    " keep 500 lines of command line history
set ruler          " show the cursor position all the time
set showcmd        " display incomplete commands
set incsearch      " do incremental searching

" Some code folding options
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=0

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set laststatus=2
set relativenumber
set undofile

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" search related settings
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

au FocusLost * :wa

