" These only work with C like languages and only if the closing } of a
" function is on the first column of a new line
" select the entire function
nmap <Leader>vaf ][[{V$]}

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

" Sideways helpers
nmap <Leader>sl :SidewaysLeft<CR>
nmap <Leader>sr :SidewaysRight<CR>

" Find TODO & FIXME notes
nmap <Leader>todo /\c\<\(to\(\s\\|-\)*do\)\\|\(fix\(\s\\|-\)*me\)\>/ <cr>

" Map for reformatting a file
map <Leader>rf mzgg=G`z<CR>
" Map <Leader>cd to change directories to the directory of the current file
nnoremap <Leader>cd :cd %:p:h<cr>
