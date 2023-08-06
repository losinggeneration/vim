-- UI addition
return {
	{
		"vim-ctrlspace/vim-ctrlspace",
		cmd = "CtrlSpace",
		keys = {
			{ "<leader>u<space>", [[:CtrlSpace<CR>]], desc = "CtrlSpace" },
		},
	},
	{
		"majutsushi/tagbar",
		keys = {
			{ "<F8>", ":TagbarToggle<CR>", desc = "Toggle TagBar", silent = true },
		},
	},
}
