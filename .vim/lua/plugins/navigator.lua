return {
	"ray-x/navigator.lua", -- LSP code navigation
	dependencies = {
		"ray-x/guihua.lua", -- GUI utils, not completions
		build = "cd lua/fzy && make",
		config = function()
			require("guihua.maps").setup()
		end,
	},
	opts = {
		mason = true,
		lsp = {
			-- without this, it conflicts with noice:
			-- `vim.lsp.handlers["textDocument/hover"]` has been overwritten by another plugin?
			-- Either disable the other plugin or set `config.lsp.hover.enabled = false` in your **Noice** config.
			hover = false,
		},
	},
}
