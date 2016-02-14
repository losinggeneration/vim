let g:syntastic_mode_map = { 'mode': 'active',
			\ 'active_filetypes': ['c', 'go', 'javascript'],
			\ 'passive_filetypes': ['html', 'json'] }

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

