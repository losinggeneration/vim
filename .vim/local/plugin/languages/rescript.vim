if empty(&filetype)
	finish
endif

let g:LanguageClient_serverCommands["rescript"] = ['~/.vim/plugged/vim-rescript/rescript-vscode/extension/server/out/server.js', '--node-ipc']

" Hook up the ReScript autocomplete function
set omnifunc=rescript#Complete

" When preview is enabled, omnicomplete will display additional
" information for a selected item
set completeopt+=preview
