if empty(&filetype)
	finish
endif

au FileType elm nnoremap <leader>el :ElmEvalLine<CR>
au FileType elm vnoremap <leader>es :<C-u>ElmEvalSelection<CR>
au FileType elm nnoremap <leader>em :ElmMakeCurrentFile<CR>
