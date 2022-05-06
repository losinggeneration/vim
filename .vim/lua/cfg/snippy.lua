-- nvim-snippy
require'snippy'.setup({
	mappings = {
		is = {
			["<C-k>"] = "expand_or_advance",
			["<C-S-k>"] = "previous",
		},
		nx = {
			["<leader>x"] = "cut_text",
		},
	},
})
