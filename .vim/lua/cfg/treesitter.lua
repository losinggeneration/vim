local M = {}

M.treesitter = function()
	-- treesitter textobject support
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"bash",
			"c",
			"cmake",
			"cpp",
			"css",
			"diff",
			"dockerfile",
			"gitcommit",
			"go",
			"javascript",
			"json",
			"jsonnet",
			"lua",
			"nix",
			"qmljs",
			"rust",
			"scheme",
			"typescript",
			"v",
			"vim",
			"zig",
		},
		auto_install = true,
		incremental_selection = {
			enable = true,
			keymaps = {
				-- mappings for incremental selection (visual mappings)
				init_selection = "gnn", -- maps in normal mode to init the node/scope selection
				node_incremental = "grn", -- increment to the upper named parent
				scope_incremental = "grc", -- increment to the upper scope (as defined in locals.scm)
				node_decremental = "grm", -- decrement to the previous node
			},
		},
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
	})
end

M.textobjects = function()
	-- treesitter textobject support
	require("nvim-treesitter.configs").setup({
		textobjects = {
			--syntax-aware textobjects
			enable = true,
			lookahead = true,
			lsp_interop = {
				enable = true,
				peek_definition_code = {
					["<leader>df"] = "@function.outer",
					["<leader>dF"] = "@class.outer",
				},
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
				["im"] = "@call.inner",
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]m"] = "@class.outer",
					["]]"] = "@function.outer",
				},
				goto_next_end = {
					["]M"] = "@class.outer",
					["]["] = "@function.outer",
				},
				goto_previous_start = {
					["[m"] = "@class.outer",
					["[["] = "@function.outer",
				},
				goto_previous_end = {
					["[M"] = "@class.outer",
					["[]"] = "@function.outer",
				},
			},
			select = {
				enable = true,
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>s"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>S"] = "@parameter.inner",
				},
			},
		},
	})
end

return M
