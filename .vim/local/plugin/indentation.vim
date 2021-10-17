" Only do this part when compiled with support for autocommands.
if has("autocmd")
	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on
	filetype plugin on

	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		au!

		" For all text files set 'textwidth' to 78 characters.
		autocmd FileType text setlocal textwidth=78

		" spaces
		autocmd Filetype sh setlocal ts=4 sts=4 sw=4 expandtab list lcs=tab:»»,trail:…
		autocmd Filetype html setlocal ts=4 sts=4 sw=4 expandtab list lcs=tab:»»,trail:…
		autocmd Filetype ruby,eruby setlocal ts=2 sts=2 sw=2 expandtab list lcs=tab:»»,trail:…
		autocmd Filetype yaml,yml setlocal ts=2 sts=2 sw=2 expandtab list lcs=tab:»»,trail:…
		autocmd Filetype markdown setlocal ts=2 sts=2 sw=2 expandtab list lcs=tab:»»,trail:…
		autocmd Filetype php setlocal ts=4 sts=4 sw=4 expandtab list lcs=tab:»»,trail:…
		autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab list lcs=tab:»»,trail:…
		autocmd Filetype coffee setlocal ts=4 sts=4 sw=4 expandtab list lcs=tab:»»,trail:…
		autocmd Filetype moon setlocal ts=4 sts=4 sw=4 list lcs=tab:»»,trail:…
		autocmd Filetype less setlocal ts=4 sts=4 sw=4 expandtab list lcs=tab:»»,trail:…
		autocmd Filetype scss setlocal ts=4 sts=4 sw=4 expandtab list lcs=tab:»»,trail:…

		" PEP 8
		autocmd FileType py setlocal ts=4 sts=4 sw=4 textwidth=79 expandtab autoindent fileformat=unix lcs=tab:»»,trail:…

		" tabs
		autocmd Filetype go setlocal noet ts=4 sts=4 sw=4 list lcs=tab:»-,trail:…
		autocmd Filetype vim setlocal noet ts=4 sts=4 sw=4 list lcs=tab:»-,trail:…
		autocmd Filetype zsh setlocal noet ts=4 sts=4 sw=4 list lcs=tab:»-,trail:…

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		autocmd BufReadPost *
					\ if line("'\"") > 0 && line("'\"") <= line("$") |
					\   exe "normal g`\"" |
					\ endif

		let g:indentLine_char = '⦙'
	augroup END
else
	set autoindent		" always set autoindenting on
endif " has("autocmd")
