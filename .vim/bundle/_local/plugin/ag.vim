" The Silver Searcher
if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --vimgrep\ --nogroup\ --nocolor\ --ignore\ \"*~\"

	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s --vimgrep -l --ignore "*~" --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0

	" bind K to grep word under cursor
	nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>

	" bind \ (backward slash) to grep shortcut
	command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw|

	nnoremap \ :Ag<SPACE>
endif
