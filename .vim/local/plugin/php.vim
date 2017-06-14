let g:php_syntax_extensions_enabled=["core","curl","date","hash","iconv","json","mbstring","mcrypt","openssl","reflection","standard","bcmath"]
let g:php_folding=2
au FileType php setlocal foldmethod=syntax

function! PhpSyntaxOverride()
	hi! def link phpDocTags  phpDefine
	hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
	autocmd!
	autocmd FileType php call PhpSyntaxOverride()
augroup END
