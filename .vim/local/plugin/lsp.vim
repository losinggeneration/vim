" automatically start language servers.
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {}

if executable('docker-langserver')
	let g:LanguageClient_serverCommands["dockerfile"] = ['docker-langserver', '--stdio']
endif

