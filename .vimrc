" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"     For Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

set hidden

"set t_Co=256
colorscheme aldmeris

" Check for whitespace damage
let c_space_errors = 1

" Leader for things like NERDCommenter
let mapleader = ","

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

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

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch

  highlight Normal guibg=black guifg=White
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  filetype plugin on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab list lcs=tab:»»,trail:…
  autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab list lcs=tab:»»,trail:…
  autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 expandtab list lcs=tab:»»,trail:…
  autocmd Filetype yml setlocal ts=2 sts=2 sw=2 expandtab list lcs=tab:»»,trail:…
  autocmd Filetype php setlocal ts=4 sts=4 sw=4 expandtab list lcs=tab:»»,trail:…
  autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab list lcs=tab:»»,trail:…
  autocmd Filetype scss setlocal ts=4 sts=4 sw=4 expandtab list lcs=tab:»»,trail:…
  autocmd Filetype go setlocal noet ts=4 sts=4 sw=4

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

"set formatoptions=crt
"set textwidth=80
"set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set number

" Some more white space checks
function ShowSpaces(...)
  let @/="\\v(\\s+$)|( +\\ze\\t)"
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
"nnoremap <F12>     :ShowSpaces 1<cr>
nnoremap <S-F12>   m`:TrimSpaces<cr>``
vnoremap <S-F12>   :TrimSpaces<cr>


" Use goimports for Fmt
let g:go_fmt_command = "goimports"

" Enable syntax-highlighting for Functions, Methods and Structs.
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" Use neosnippet
let g:go_snippet_engine = "neosnippet"

" Go tools bindings
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>gb :!go build<cr>
au FileType go nmap <Leader>c :!go build "%:p"<cr>
au FileType go nmap <Leader>f :GoFmt<cr>
au FileType go nmap <Leader>F :!go fmt<cr>
au FileType go nmap <Leader>l :GoLint<cr>
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>tc <Plug>(go-coverage)
au FileType go nmap <Leader>v <Plug>(go-vet)
au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <Leader>in <Plug>(go-info)
au FileType go nmap <Leader>r <Plug>(go-rename)
au FileType go nmap <Leader>i <Plug>(go-implements)

" Godeps tool bindings
au FileType go nmap <Leader>gdg :!godep get<cr>

" Moonscript tools bindings
au FileType moon nmap <Leader>c :!moonc "%:p"<cr>
au FileType moon nmap <Leader>b :!moonc "%:p:h"<cr>
au FileType moon nmap <Leader>l :!moonc -l "%:p"<cr>

function! ShowWhitespace()
  " show tabs and whitespace at eol
  let b:showWS = 1
  syntax match STab " \t" containedin=ALL
  syntax match TabS "\t " containedin=ALL
  syntax match LineEndWS "\s\+$" containedin=ALL
  echo "show Whitespace"
endfunction

function! HideWhitespace()
  " hide tabs and whitespace at eol
  let b:showWS = 0
  syntax clear TabS
  syntax clear STab
  syntax clear LineEndWS
  echo "hide Whitespace"
endfunction

function! ToggleShowWhitespace()
  if !exists('b:showWS')
    let b:showWS = 0
  endif
  " toggle variable
  let b:showWS = !b:showWS
  if b:showWS == 1
    call ShowWhitespace()
  else
    call HideWhitespace()
  endif
endfunction

highlight TabS term=standout cterm=standout gui=standout
highlight STabs term=standout cterm=standout gui=standout
highlight link LineEndWS Error

nnoremap <F12>	:call ToggleShowWhitespace()<CR>
if has("autocmd")
  au VimEnter,BufRead * silent call ShowWhitespace()
endif

map <C-a> \c<space><CR>

call pathogen#infect()
call pathogen#helptags()

" .md is markdown
au BufRead,BufNewFile *.md set filetype=markdown

" Sort scala imports into 3 main groups, Core, 3rd party, & 1st party
let g:scala_sort_across_groups=1

" Some code folding options
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=0

" Map ctrl-[hjkl] to change windows
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
" Map W-[left,right,up,down] to change windows
nnoremap <silent> <M-Left> <C-w>h
nnoremap <silent> <M-Right> <C-w>l
nnoremap <silent> <M-Up> <C-w>k
nnoremap <silent> <M-Down> <C-w>j

" Map vv to vertical split
nnoremap <silent> vv <C-w>v
" Map vs to horizontal split
nnoremap <silent> vs <C-w>s
" Map Q to :q
nnoremap <silent> Q :q<cr>

let g:UltiSnipsExpandTrigger="<c-cr>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['c', 'go', 'javascript'],
                           \ 'passive_filetypes': ['html', 'json'] }

" Vaxe related options
set completeopt=menu
set autowrite

" Map F3 to toggle NERDTree
nnoremap <F3> :NERDTreeToggle<CR>
" Map F4 to toggle Tagbar
nnoremap <F4> :TagbarToggle<CR>
inoremap <F4> :TagbarToggle<CR>

" Map <Leader>cd to change directories to the directory of the current file
nnoremap <Leader>cd :cd %:p:h<cr>

