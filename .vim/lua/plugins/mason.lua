return {
	{
		"williamboman/mason-lspconfig.nvim",

		opts = {
			ensure_installed = {
				"clangd",
				"gopls",
				"efm",
				"jsonls",
				"rust_analyzer",
				"teal_ls",
				"tsserver",
				"zls",
				"lua_ls",
			},
		},
		config = function(_, opts) end,
	},
	{
		"williamboman/mason.nvim",

		config = function(_, opts)
			require("mason").setup(opts)
		end,
	},
}
