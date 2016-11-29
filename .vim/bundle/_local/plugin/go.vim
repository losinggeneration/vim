" Use goimports for Fmt
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'errcheck', 'staticheck', 'deadcode', 'gotype', 'vetshadow', 'varcheck', 'goconst', 'interfacer', 'gosimple', 'structcheck']
let g:go_metalinter_deadline = "10s"

"let g:go_auto_type_info = 1
let g:go_fmt_autosave = 1
let g:go_fmt_fail_silently = 1
let g:go_list_type = "quickfix"

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
let g:go_snippet_engine = "ultrisnippet"

" Go tools bindings
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>f :GoFmt<cr>
au FileType go nmap <Leader>c <Plug>(go-callees)
au FileType go nmap <Leader>cr <Plug>(go-callers)
au FileType go nmap <Leader>cs <Plug>(go-callstack)
au FileType go nmap <Leader>l <Plug>(go-metalinter)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>tc <Plug>(go-coverage)
au FileType go nmap <Leader>tct <Plug>(go-coverage-toggle)
au FileType go nmap <Leader>tcc <Plug>(go-coverage-clear)
au FileType go nmap <Leader>v <Plug>(go-vet)
au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>r <Plug>(go-rename)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>y <Plug>(go-run)
au FileType go nmap gd <Plug>(go-def)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
