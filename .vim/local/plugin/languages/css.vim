if empty(&filetype)
	finish
endif

if executable('css-languageserver')
	let g:LanguageClient_serverCommands["css"] = ['css-languageserver', '--stdio']
	let g:LanguageClient_serverCommands["less"] = ['css-languageserver', '--stdio']
	let g:LanguageClient_serverCommands["sass"] = ['css-languageserver', '--stdio']
	let g:LanguageClient_serverCommands["scss"] = ['css-languageserver', '--stdio']
endif
