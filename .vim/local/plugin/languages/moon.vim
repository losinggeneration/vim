if empty(&filetype)
	finish
endif

" Moonscript tools bindings
nmap <Leader>c :!moonc "%:p"<cr>
nmap <Leader>b :!moonc "%:p:h"<cr>
nmap <Leader>l :!moonc -l "%:p"<cr>
