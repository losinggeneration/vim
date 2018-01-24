if has("nvim")
	set background=dark
	" hack around poorly behaving clients :(
	if has('gui_running')
		colorscheme desert
	endif

	" Map Esc to exit insert mode in the terminal
	tnoremap <Esc> <C-\><C-n>
	tnoremap jj <C-\><C-n>
endif

source <sfile>:p:h/colorscheme.vim

