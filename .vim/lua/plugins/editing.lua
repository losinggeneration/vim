-- editing improvements
return {
	"ciaranm/securemodelines",
	"christoomey/vim-sort-motion",
	"tpope/vim-abolish",
	"tpope/vim-repeat",
	"tpope/vim-sensible",
	"tpope/vim-surround",
	-- "lukas-reineke/indent-blankline.nvim",
	--"xolox/vim-misc",
	{
		"AndrewRadev/sideways.vim",
		keys = {
			{ "<Leader>csl", ":SidewaysLeft<CR>", desc = "<- sideways" },
			{ "<Leader>csr", ":SidewaysRight<CR>", desc = "sideways ->" },
		},
	},
	"tpope/vim-endwise",
	{
		"mbbill/undotree",
		cmd = "UndooTree",

		keys = {
			{ "<leader>uu", vim.cmd.UndotreeToggle, desc = "UndoTree Toggle" },
		},
	},
	{
		"tpope/vim-sleuth",
		-- This can cause some issues with file types not respecting the
		-- desired global indentation. This also is what causes the
		-- initial text when nvim is open to go away without input.
		-- Because this also messes with the filetype, it can also
		-- cause color scheme colors to not load correctly.
		enabled = false,
	},

	-- coding improvments
	{
		"vim-autoformat/vim-autoformat",
		keys = {
			{ "<Leader>rf", ":Autoformat<CR>", remap = true },
			{ "<Leader>rfl", ":AutoformatLine<CR>" },
		},
	},
	{
		"windwp/nvim-autopairs",
		opts = {
			disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },
		},
	},
}
