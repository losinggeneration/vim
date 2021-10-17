if empty(&filetype)
	finish
endif

if executable('css-languageserver')
	let g:LanguageClient_serverCommands["css"] = ['css-languageserver', '--stdio']
	let g:LanguageClient_serverCommands["less"] = ['css-languageserver', '--stdio']
	let g:LanguageClient_serverCommands["sass"] = ['css-languageserver', '--stdio']
	let g:LanguageClient_serverCommands["scss"] = ['css-languageserver', '--stdio']
endif

let g:ale_javascript_eslint_use_global=1
let g:ale_javascript_prettier_use_global=1
let g:ale_scss_prettier_use_global=1

let g:ale_linters['css'] = ['prettier']
let g:ale_linters['less'] = ['prettier']
let g:ale_linters['scss'] = ['prettier']
let g:ale_linters['sass'] = ['prettier']
let g:ale_fixers['scss'] = ['prettier']

nmap <Leader>l <Plug>(ale_lint)
