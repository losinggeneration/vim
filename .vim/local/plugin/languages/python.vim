if empty(&filetype)
	finish
endif

let python_highlight_all=1

if executable('pyls')
	let g:LanguageClient_serverCommands["python"] = ['pyls']
endif

