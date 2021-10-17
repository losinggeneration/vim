if empty(&filetype)
	finish
endif

"if executable('typescript-language-server')
	let g:LanguageClient_serverCommands["typescript"] = ['typescript-language-server', '--stdio']
	let g:LanguageClient_serverCommands["typescript.tsx"] = ['typescript-language-server', '--stdio']
"endif

let g:ale_linters['typescript.tsx'] = ['eslint', 'prettier']
let g:jsx_ext_required = 0
