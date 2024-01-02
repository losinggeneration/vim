if vim.g.disable_lazy_plugins == true then
	return {}
end

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-cmdline", -- command line suggestions source
		"hrsh7th/cmp-omni", -- Vim's omnifunc source
		{
			"petertriho/cmp-git",
			dependencies = "nvim-lua/plenary.nvim",
		},
		-- {
		-- 	"kristijanhusak/vim-dadbod-completion",
		-- 	ft = { "sql", "mysol", "plsql" },
		-- 	config = function()
		-- 		require("cmp").setup.buffer({
		-- 			sources = { {
		-- 				name = "vim-dadbod-completion",
		-- 			} },
		-- 		})
		-- 	end,
		-- },
		-- {
		-- 	"nvim-telescope/telescope-fzf-native.nvim",
		-- 	build = "make",
		-- 	cond = vim.fn.executable("make") == 1,
		-- },
	},

	opts = function(_, opts)
		local cmp = require("cmp")

		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "cmp_git" },
			}, {
				{ name = "buffer" },
			}),
		})

		-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})

		return opts
	end,
}
