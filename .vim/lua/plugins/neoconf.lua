if vim.g.disable_extra_plugins == true then
	return {}
end

return {
	"folke/neoconf.nvim",

	opts = {
		-- name of the local settings files
		local_settings = ".neoconf.json",
		-- name of the global settings file in your neovim config directory
		global_settings = "neoconf.json",
		-- import existing settinsg from other plugins
		import = {
			vscode = true, -- local .vscode/settings.json
			coc = true, -- global/local coc-settings.json
			nlsp = true, -- global/local nlsp-settings.nvim json settings
		},
		-- send new configuration to lsp clients when changing json settings
		live_reload = true,
		-- set the filetype to jsonc for settings files, so you can use comments
		-- make sure you have the jsonc treesitter parser installed!
		filetype_jsonc = true,
		plugins = {
			-- configures lsp clients with settings in the following order:
			-- - lua settings passed in lspconfig setup
			-- - global json settings
			-- - local json settings
			lspconfig = {
				enabled = true,
			},
			gopls = {
				enabled = true,
			},
			-- configures jsonls to get completion in .nvim.settings.json files
			jsonls = {
				enabled = true,
				-- only show completion in json settings for configured lsp servers
				configured_servers_only = true,
			},
			-- configures lua_ls to get completion of lspconfig server settings
			lua_ls = {
				-- by default, lua_ls annotations are only enabled in your neovim config directory
				enabled_for_neovim_config = true,
				-- explicitely enable adding annotations. mostly relevant to put in your local .nvim.settings.json file
				enabled = true,
			},
		},
	},
}
