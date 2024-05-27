return {
	-- color schemes
	{
		--"gruvbox-community/gruvbox", -- VimScript standard
		"ellisonleao/gruvbox.nvim", -- Treesitter highlighting
		{
			"sainnhe/gruvbox-material", -- VimScript + treesitter support with a softer pallete
			init = function()
				vim.g.gruvbox_material_foreground = "original" -- material (default), mix, or original
				-- vim.g.gruvbox_material_background = "medium" -- soft, medium (default), or hard
				vim.g.gruvbox_material_enable_bold = 1
			end,
		},
		"luisiacc/gruvbox-baby",
		"tomasr/molokai",
		"veloce/vim-aldmeris",
		"bluz71/vim-moonfly-colors",
		"bluz71/vim-nightfly-guicolors",
	},

	-- Configure LazyVim to load gruvbox
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox-material",
		},
	},
}
