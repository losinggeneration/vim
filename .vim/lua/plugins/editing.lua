return {
	"tpope/vim-surround",
	{
		"AndrewRadev/sideways.vim",
		config = function()
			-- Sideways helpers
			vim.keymap.set("n", "<Leader>csl", ":SidewaysLeft<CR>", { desc = "<- sideways" })
			vim.keymap.set("n", "<Leader>csr", ":SidewaysRight<CR>", { desc = "sideways ->" })
		end,
	},
}
