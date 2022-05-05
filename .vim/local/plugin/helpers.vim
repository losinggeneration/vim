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
"map <Leader>rf mzgg=G`z<CR>
map <Leader>rf :Autoformat<CR>
map <Leader>rfl :AutoformatLine<CR>

" Map <Leader>cd to change directories to the directory of the current file
nnoremap <Leader>cd :cd %:p:h<cr>

nmap <Leader>jq GVgg :!jq .<cr>

" Redirect the output of a Vim or external command into a scratch buffer
function! Redir(cmd) abort
    let output = execute(a:cmd)
    tabnew
    setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
    call setline(1, split(output, "\n"))
endfunction
command! -nargs=1 Redir silent call Redir(<f-args>)
