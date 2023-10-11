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
