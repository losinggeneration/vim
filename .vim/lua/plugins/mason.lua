if vim.g.disable_extra_plugins == true then
	return {}
end

return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"gopls",
				"rust-analyzer",
				"teal-language-server",
				"zls",
				"lua-language-server",
				"golangci-lint",
				"golangci-lint-langserver",
			},
		},
	},
}
