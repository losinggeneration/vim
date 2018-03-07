if empty(&filetype)
	finish
endif

" Use goimports for Fmt
let g:go_fmt_command = 'goimports'
let g:go_fmt_autosave = 1
let g:go_fmt_fail_silently = 1
" this will restore folds and attempt to preserve undo history
let g:go_fmt_experimental = 1

let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'gocyclo']
let g:go_metalinter_deadline = '20s'
let g:go_metalinter_enabled = [
			\ 'maligned',
			\ 'deadcode',
			\ 'errcheck',
			\ 'gas',
			\ 'goconst',
			\ 'gocyclo',
			\ 'gofmt',
			\ 'goimports',
			\ 'gotype',
			\ 'ineffassign',
			\ 'interfacer',
			\ 'megacheck',
			\ 'misspell',
			\ 'safesql',
			\ 'structcheck',
			\ 'unconvert',
			\ 'unparam',
			\ 'varcheck',
			\ 'vet',
			\ 'vetshadow',
			\ ]

let g:go_auto_type_info = 1
let g:go_list_type = 'quickfix'
let g:go_info_mode = 'gocode'

" echodoc does better than this
let g:go_echo_go_info = 0
" This stops Go function preview/tip
set completeopt=menu

let g:go_template_use_pkg = 1

" Enable syntax-highlighting for Functions, Methods and Structs.
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1
" May become sluggish with these three
let g:go_highlight_structs = 0
let g:go_highlight_interfaces = 0
let g:go_highlight_operators = 0

" Use neosnippet
let g:go_snippet_engine = 'neosnippet'

function! go#UpdateTags(start, end, count, ...) abort
	call call("go#tags#Remove", [a:start, a:end, a:count] + a:000)
	call call("go#tags#Add", [a:start, a:end, a:count] + a:000)
endfunction

command! -nargs=* -range GoUpdateTags call go#UpdateTags(<line1>, <line2>, <count>, <f-args>)

" Use indent mode for folding
setlocal foldmethod=indent

" Go tools bindings
nmap <Leader>b <Plug>(go-build)
nmap <Leader>f :GoFmt<cr>
nmap <Leader>c <Plug>(go-callees)
nmap <Leader>cr <Plug>(go-callers)
nmap <Leader>cs <Plug>(go-callstack)
nmap <Leader>l <Plug>(go-metalinter)
nmap <Leader>t <Plug>(go-test)
nmap <Leader>tc <Plug>(go-coverage)
nmap <Leader>tct <Plug>(go-coverage-toggle)
nmap <Leader>tcc <Plug>(go-coverage-clear)
nmap <Leader>v <Plug>(go-vet)
nmap <Leader>d <Plug>(go-doc)
nmap <Leader>gi <Plug>(go-install)
nmap <Leader>i <Plug>(go-info)
nmap <Leader>r <Plug>(go-rename)
nmap <Leader>ref <Plug>(go-referrers)
nmap <Leader>s <Plug>(go-implements)
nmap <Leader>y <Plug>(go-run)
nmap <Leader>a :GoAlternate<cr>
nmap gd <Plug>(go-def)

nmap <Leader>ds <Plug>(go-def-split)
nmap <Leader>dv <Plug>(go-def-vertical)
nmap <Leader>dt <Plug>(go-def-tab)

nmap <Leader>gd <Plug>(go-doc)
nmap <Leader>gv <Plug>(go-doc-vertical)
