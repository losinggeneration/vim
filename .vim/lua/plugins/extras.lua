if vim.g.disable_extra_plugins == true then
	return {}
end

local extras = {
	{ import = "lazyvim.plugins.extras.lang.go" },
	{ import = "lazyvim.plugins.extras.dap.core" },
	{ import = "lazyvim.plugins.extras.dap.nlua" },
	-- { import = "lazyvim.plugins.extras.ui.mini-animate" },
	{ import = "lazyvim.plugins.extras.lsp.neoconf" },
	{ import = "lazyvim.plugins.extras.editor.illuminate" },
	{ import = "lazyvim.plugins.extras.coding.luasnip" },
}

if vim.g.local_config_extras_enable_rust then
	table.insert(extras, { import = "lazyvim.plugins.extras.lang.rust" })
end

if vim.g.local_config_extras_enable_clangd then
	table.insert(extras, { import = "lazyvim.plugins.extras.lang.clangd" })
end

if vim.g.local_config_extras_enable_typescript then
	table.insert(extras, { import = "lazyvim.plugins.extras.lang.typescript" })
end

if vim.g.local_config_extras_enable_python then
	table.insert(extras, { import = "lazyvim.plugins.extras.lang.python" })
end

if vim.g.local_config_extras_enable_elixir then
	table.insert(extras, { import = "lazyvim.plugins.extras.lang.elixir" })
end

if vim.g.local_config_extras_enable_sql then
	table.insert(extras, { import = "lazyvim.plugins.extras.lang.sql" })
end

if vim.g.local_config_extras_enable_cmake then
	table.insert(extras, { import = "lazyvim.plugins.extras.lang.cmake" })
end

if vim.g.local_config_extras_enable_markdown then
	table.insert(extras, { import = "lazyvim.plugins.extras.lang.markdown" })
end

if vim.g.local_config_extras_enable_terraform then
	table.insert(extras, { import = "lazyvim.plugins.extras.lang.terraform" })
end

if vim.g.local_config_extras_enable_yaml then
	table.insert(extras, { import = "lazyvim.plugins.extras.lang.yaml" })
end

if vim.g.local_config_extras_enable_toml then
	table.insert(extras, { import = "lazyvim.plugins.extras.lang.toml" })
end

if vim.g.local_config_extras_enable_json then
	table.insert(extras, { import = "lazyvim.plugins.extras.lang.json" })
end

return extras
