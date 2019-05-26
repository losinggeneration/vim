if empty(&filetype)
	finish
endif

if executable('flow-language-server')
	let g:LanguageClient_serverCommands["javascript"] = ['flow-language-server', '--stdio']
	let g:LanguageClient_serverCommands["javascript.jsx"] = ['flow-language-server', '--stdio']
endif

let g:jsx_ext_required = 0
