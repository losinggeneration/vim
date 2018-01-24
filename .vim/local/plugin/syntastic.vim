" Go preferences
let g:syntastic_go_checkers = ['gotype', 'go']
" lighter weight, but doesn't seem to always catch everything
" let g:syntastic_go_checkers = ['gotype', 'errcheck', 'govet', 'gofmt']
let g:syntastic_go_gotype_args = "-a"

" Javascript preferences
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'

let g:syntastic_mode_map = { 'mode': 'active',
			\ 'active_filetypes': ['c', 'javascript', 'go'],
			\ 'passive_filetypes': ['php', 'html', 'json'] }

" quick keys to check, reset, & toggle mode
nmap <Leader>sc :SyntasticCheck<cr>
nmap <Leader>ss :SyntasticReset<cr>
nmap <Leader>st :SyntasticToggleMode<cr>
" Error navigation
nmap <Leader>n :lne<cr>
nmap <Leader>p :lp<cr>

" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

