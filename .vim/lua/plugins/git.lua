if vim.g.disable_extra_plugins == true then
	return {}
end

return {
	{
		"tpope/vim-fugitive",
		cmd = { "G", "Gdiff" },
		keys = {
			{ "<Leader>gd", ":Gdiff<cr>", desc = "diff" },
			{ "<Leader>gcc", ":G commit<cr>", desc = "commit" },
			{ "<Leader>gcv", ":G commit -v<cr>", desc = "commit -v" },
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		keys = {
			{ "<leader>gc", false }, -- disable git commits so it can be remapped
			{ "<leader>gcl", "<cmd>Telescope git_commits<CR>", desc = "list" },
		},
	},
	{
		"folke/which-key.nvim",
		opts = {
			spec = {
				{ "<leader>gc", name = "commits" },
			},
		},
	},
	{
		import = "lazyvim.plugins.extras.util.octo",
		keys = {
			{
				"<space>gpt",
				[[:lua require("octo.reviews.thread-panel").show_review_threads()<cr>]],
				desc = "Show review threads",
			},
		},
	},
}
