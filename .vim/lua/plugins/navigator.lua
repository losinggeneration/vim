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
		-- lsp = {
		-- disable_lsp = "all",
		-- },
	},
}
