if has("nvim")
	set background=dark
	" hack around poorly behaving clients :(
	if has('gui_running')
		colorscheme aldmeris
	endif

	colorscheme gruvbox

	" terminal bindings
	:tnoremap <Esc> <C-\><C-n>
endif
