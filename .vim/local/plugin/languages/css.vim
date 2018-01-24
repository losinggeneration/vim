if empty(&filetype)
	finish
endif

if executable('css-languageserver')
	let g:LanguageClient_serverCommands = {
			\ "css": ['css-languageserver', '--stdio'],
			\ "less": ['css-languageserver', '--stdio'],
			\ "sass": ['css-languageserver', '--stdio'],
			\ "scss": ['css-languageserver', '--stdio'],
			\ }
endif
