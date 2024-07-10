if vim.g.disable_extra_plugins == true then
	return {}
end

local extras = {
	{ import = "lazyvim.plugins.extras.lang.go" },
	{ import = "lazyvim.plugins.extras.lang.rust" },
	{ import = "lazyvim.plugins.extras.dap.core" },
	{ import = "lazyvim.plugins.extras.dap.nlua" },
	-- { import = "lazyvim.plugins.extras.ui.mini-animate" },
	{ import = "lazyvim.plugins.extras.lsp.neoconf" },
	{ import = "lazyvim.plugins.extras.editor.illuminate" },
	{ import = "lazyvim.plugins.extras.coding.luasnip" },
}

if vim.g.local_config_extras_enable_typescript then
	print("typescript")
	table.insert(extras, {import = "lazyvim.plugins.extras.lang.typescript"})
end

if vim.g.local_config_extras_enable_yaml then
	table.insert(extras, {import = "lazyvim.plugins.extras.lang.yaml"})
end

if vim.g.local_config_extras_enable_json then
	table.insert(extras, {import = "lazyvim.plugins.extras.lang.json"})
end

return extras
