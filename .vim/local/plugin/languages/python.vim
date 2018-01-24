if empty(&filetype)
	finish
endif

if executable('pyls')
	let g:LanguageClient_serverCommands = {
			\ "python": ['pyls'],
			\ }
endif

