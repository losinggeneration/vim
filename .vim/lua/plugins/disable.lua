return {
	{
		"tpope/vim-sleuth",
		-- This can cause some issues with file types not respecting the
		-- desired global indentation. This also is what causes the
		-- initial text when nvim is open to go away without input.
		-- Because this also messes with the filetype, it can also
		-- cause color scheme colors to not load correctly.
		enabled = false,
	},
	{
		"akinsho/bufferline.nvim",
		enabled = false,
	},
	{
		"echasnovski/mini.pairs",
		enabled = false,
	},
	{
		"folke/flash.nvim",
		enabled = false,
	},
	{
		"echasnovski/mini.comment",
		enabled = false,
	},
}
