if has("nvim")
	set background=dark
	" hack around poorly behaving clients :(
	if has('gui_running')
		colorscheme aldmeris
	endif

	colorscheme gruvbox

	" Map Esc to exit insert mode in the terminal
	tnoremap <Esc> <C-\><C-n>
	tnoremap jj <C-\><C-n>
endif
