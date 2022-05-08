if exists("g:completion") && g:completion == 'cmp'
	set completeopt=menu,menuone,noselect

" LuaSnip keymap
if 0
imap <silent><expr> <C-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
inoremap <silent> <C-S-k> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <C-S-k> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
endif


if 0
autocmd TextChangedI,TextChangedP * call s:on_complete_check()

function! s:on_complete_check() abort
lua <<EOF
	local line = vim.api.nvim_get_current_line()
	local cursor = vim.api.nvim_win_get_cursor(0)[2]

	local current = string.sub(line, cursor, cursor + 1)
	if current == "." or current == "," or current == " " then
		require('cmp').close()
	end

	local before_line = string.sub(line, 1, cursor + 1)
	local after_line = string.sub(line, cursor + 1, -1)
	if not string.match(before_line, '^%s+$') then
		if after_line == "" or string.match(before_line, " $") or string.match(before_line, "%.$") then
			require('cmp').complete()
		end
	end
EOF
endfunction
endif

endif
