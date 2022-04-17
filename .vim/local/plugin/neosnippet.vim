if g:use_deoplete
let g:neosnippet#enable_completed_snippet = 1

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
endif

if 0
	imap <expr> <C-k> snippy#can_expand_or_advance() ? '<Plug>(snippy-expand-or-next)' : '<Tab>'
	imap <expr> <C-S-k> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<Tab>'
	smap <expr> <C-k> snippy#can_jump(1) ? '<Plug>(snippy-next)' : '<Tab>'
	smap <expr> <C-S-k> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<Tab>'
	xmap <Tab> <Plug>(snippy-cut-text)
endif
