-- add gruvbox
return {
	-- color schemes
	{
		--"gruvbox-community/gruvbox", -- VimScript standard
		"ellisonleao/gruvbox.nvim", -- Treesitter highlighting
		"sainnhe/gruvbox-material", -- VimScript + treesitter support with a softer pallete
		"tomasr/molokai",
		"veloce/vim-aldmeris",
		"bluz71/vim-moonfly-colors",
		"bluz71/vim-nightfly-guicolors",
	},

	-- Configure LazyVim to load gruvbox
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox",
		},
	},
}
