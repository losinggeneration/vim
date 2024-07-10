if vim.g.disable_extra_plugins == true then
	return {}
end

return {
	{ import = "lazyvim.plugins.extras.lang.go" },
	{ import = "lazyvim.plugins.extras.lang.typescript" },
	{ import = "lazyvim.plugins.extras.lang.json" },
	{ import = "lazyvim.plugins.extras.lang.rust" },
	{ import = "lazyvim.plugins.extras.lang.yaml" },
	{ import = "lazyvim.plugins.extras.dap.core" },
	{ import = "lazyvim.plugins.extras.dap.nlua" },
	-- { import = "lazyvim.plugins.extras.ui.mini-animate" },
	{ import = "lazyvim.plugins.extras.lsp.neoconf" },
	{ import = "lazyvim.plugins.extras.editor.illuminate" },
	{ import = "lazyvim.plugins.extras.coding.luasnip" },
}
