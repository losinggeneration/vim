if g:use_cmp
	set completeopt=menu,menuone,noselect

lua <<EOF
-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
	preselect = cmp.PreselectMode.None,
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			require'snippy'.expand_snippet(args.body) -- For `snippy` users.
		end,
	},
	mapping = {
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		['<CR>'] = cmp.mapping.confirm({ select = false }),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp' },
		-- { name = 'spell' },
		-- { name = 'luasnip' }, -- For luasnip users.
		{ name = 'snippy' }, -- For snippy users.
		-- { name = 'neosnippet' }, -- For neosnippet users.
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

--#[[
-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig').zls.setup {
	capabilities = capabilities
}
--]]

---[[
-- nvim-snippy
require'snippy'.setup({
	mappings = {
		is = {
			["<C-k>"] = "expand_or_advance",
			["<C-S-k>"] = "previous",
		},
		nx = {
			["<leader>x"] = "cut_text",
		},
	},
})
--]]

-- navigator.lua setup
--require'navigator'.setup()
---[[
require'navigator'.setup({
	lsp = {
		disable_lsp = 'all'
	}
})

require('nvim-autopairs').setup{
	disable_filetype = { "TelescopePrompt" , "guihua", "guihua_rust", "clap_input" },
}

if vim.o.ft == 'clap_input' and vim.o.ft == 'guihua' and vim.o.ft == 'guihua_rust' then
	require'cmp'.setup.buffer { completion = {enable = false} }
end

-- or with autocmd
vim.cmd("autocmd FileType guihua lua require('cmp').setup.buffer { enabled = false }")
vim.cmd("autocmd FileType guihua_rust lua require('cmp').setup.buffer { enabled = false }")
--]]

EOF

" go.nvim setup
lua <<EOF
---[=[
require 'go'.setup({
	goimport = 'gopls', -- if set to 'gopls' will use golsp format
	gofmt = 'gopls', -- if set to gopls will use golsp format
	max_line_len = 120,
	tag_transform = false,
	test_dir = '',
	comment_placeholder = ' 	',
	lsp_cfg = true, -- false: use your own lspconfig
	lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
	lsp_on_attach = true, -- use on_attach from go.nvim
	dap_debug = true,
})

--local protocol = require'vim.lsp.protocol'

-- treesitter textobject support
require "nvim-treesitter.configs".setup {
	incremental_selection = {
		enable = enable,
		keymaps = {
			-- mappings for incremental selection (visual mappings)
			init_selection = "gnn", -- maps in normal mode to init the node/scope selection
			node_incremental = "grn", -- increment to the upper named parent
			scope_incremental = "grc", -- increment to the upper scope (as defined in locals.scm)
			node_decremental = "grm" -- decrement to the previous node
		}
	},

	textobjects = {
		-- syntax-aware textobjects
		enable = enable,
		lsp_interop = {
			enable = enable,
			peek_definition_code = {
				["DF"] = "@function.outer",
				["DF"] = "@class.outer"
			}
		},
		keymaps = {
		["iL"] = {
			-- you can define your own textobjects directly here
			go = "(function_definition) @function",
		},
		-- or you use the queries from supported languages with textobjects.scm
		["af"] = "@function.outer",
		["if"] = "@function.inner",
		["aC"] = "@class.outer",
		["iC"] = "@class.inner",
		["ac"] = "@conditional.outer",
		["ic"] = "@conditional.inner",
		["ae"] = "@block.outer",
		["ie"] = "@block.inner",
		["al"] = "@loop.outer",
		["il"] = "@loop.inner",
		["is"] = "@statement.inner",
		["as"] = "@statement.outer",
		["ad"] = "@comment.outer",
		["am"] = "@call.outer",
		["im"] = "@call.inner"
		},
		move = {
			enable = enable,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer"
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer"
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer"
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer"
			}
		},
		select = {
			enable = enable,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				-- Or you can define your own textobjects like this
				["iF"] = {
					python = "(function_definition) @function",
					cpp = "(function_definition) @function",
					c = "(function_definition) @function",
					java = "(method_declaration) @function",
					go = "(method_declaration) @function"
				}
			}
		},
		swap = {
			enable = enable,
			swap_next = {
				["<leader>a"] = "@parameter.inner"
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner"
			}
		}
	}
}
--]=]
EOF

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
