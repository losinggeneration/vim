if vim.g.disable_extra_plugins == true then
	return {}
end

return {
	{
		"williamboman/mason-lspconfig.nvim",

		opts = {
			ensure_installed = {
				"gopls",
				"rust_analyzer",
				"teal_ls",
				"zls",
				"lua_ls",
			},
		},
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"golangci-lint",
				"golangci-lint-langserver",
			},
		},
	},
}
