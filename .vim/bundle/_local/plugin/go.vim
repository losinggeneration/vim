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
