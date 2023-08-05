return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-cmdline", -- command line suggestions source
		"hrsh7th/cmp-omni", -- Vim's omnifunc source
		{
			"petertriho/cmp-git",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("cmp_git").setup()
			end,
		},
		-- Nvim API completions & docs
		{
			"folke/neodev.nvim",
			ft = { "lua", "vim" },
			config = function()
				require("neodev").setup()
			end,
		},
		{
			"windwp/nvim-autopairs",
			config = function()
				require("cfg.autopairs")
			end,
		},

		{ "reasonml-editor/vim-reason-plus", ft = "reason" },
		{
			"kristijanhusak/vim-dadbod-completion",
			ft = { "sql", "mysol", "plsql" },
			config = function()
				require("cfg.languages.sql")
			end,
		},
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = vim.fn.executable("make") == 1,
		},
		{
			"folke/trouble.nvim",
			dependencies = "nvim-tree/nvim-web-devicons",
		},
	},
	opts = function()
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
	end,
}
