" Moonscript tools bindings
au FileType moon nmap <Leader>c :!moonc "%:p"<cr>
au FileType moon nmap <Leader>b :!moonc "%:p:h"<cr>
au FileType moon nmap <Leader>l :!moonc -l "%:p"<cr>
