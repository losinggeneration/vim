if !exists("g:ale_lint_on_save")
	finish
endif

let g:airline#extensions#ale#enabled = 1

let g:ale_lint_on_text_changed=1
let g:ale_lint_on_insert_leave=1
let g:ale_lint_on_save=1

" Error navigation
nmap <Leader>n :lne<cr>
nmap <Leader>p :lp<cr>
nmap <C-k> <Plug>(ale_previous_wrap)
nmap <C-j> <Plug>(ale_next_wrap)

" Disable broken spectral linter because it conflict with a Matrix client
let g:ale_linters_ignore = {
\	'yaml': ['spectral'],
\	'json': ['spectral']
\}
