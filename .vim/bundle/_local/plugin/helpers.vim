" These only work with C like languages and only if the closing } of a
" function is on the first column of a new line
" select the entire function
nmap <Leader>vaf ][[{V$]}v

" yank an entire function
nmap <Leader>yaf <Leader>vafy

" delete an entire function
nmap <Leader>daf <Leader>vafd

" select a block
nmap <Leader>vab [{V$]}

" yank a block
nmap <Leader>yab <Leader>vaby

" delete a block
nmap <Leader>dab <Leader>vabd

"nmap <Leader>dap Vj]}d
"nmap <Leader>yap Vj]}y

" Sideways helpers
nmap <Leader>sl :SidewaysLeft<CR>
nmap <Leader>sr :SidewaysRight<CR>
