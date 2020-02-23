if empty(&filetype)
	finish
endif

if executable('lua-lsp')
	let g:LanguageClient_serverCommands = {
			\ 'lua': ['lua-lsp'],
			\ }
endif

