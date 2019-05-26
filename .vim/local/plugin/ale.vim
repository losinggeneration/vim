let g:airline#extensions#ale#enabled = 1

" Error navigation
nmap <Leader>n :lne<cr>
nmap <Leader>p :lp<cr>
nmap <C-k> <Plug>(ale_previous_wrap)
nmap <C-j> <Plug>(ale_next_wrap)
