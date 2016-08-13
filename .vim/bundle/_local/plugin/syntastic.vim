let g:syntastic_go_checkers = ['go', 'gofmt']
"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']

let g:syntastic_mode_map = { 'mode': 'active',
			\ 'active_filetypes': ['c', 'javascript'],
			\ 'passive_filetypes': ['go', 'php', 'html', 'json'] }

" Error navigation
nmap <Leader>sc :SyntasticCheck<cr>
nmap <Leader>n :lne<cr>
nmap <Leader>p :lp<cr>

" javascript preference
let g:syntastic_javascript_checkers = ['eslint']

" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

