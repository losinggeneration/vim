return {
	"tpope/vim-git",

	{
		"tpope/vim-fugitive",
		cmd = { "G", "Gdiff" },
		keys = {
			{ "<Leader>Gd", ":Gdiff<cr>", desc = "Git diff" },
			{ "<Leader>Gc", ":G commit<cr>", desc = "Git Commit" },
			{ "<Leader>Gcv", ":G commit -v<cr>", desc = "Git Commit -v" },
		},
	},
	{
		"pwntester/octo.nvim",
		cmd = "Octo",

		keys = {
			{
				"<space>tr",
				[[:lua require("octo.reviews.thread-panel").show_review_threads()<cr>]],
				desc = "Show review threads",
			},
		},
	},
}
