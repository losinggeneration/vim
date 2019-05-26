if empty(&filetype)
	finish
endif

if executable('reason-language-server')
	let g:LanguageClient_serverCommands["reason"] = ['reason-language-server']
endif
