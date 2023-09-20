-- UI addition
return {
	{
		"vim-ctrlspace/vim-ctrlspace",
		enabled = false,
		cmd = "CtrlSpace",
		config = function()
			vim.g.CtrlSpaceSetDefaultMapping = 0
		end,
		keys = {
			{ "<leader><space>", [[:CtrlSpace<CR>]], desc = "CtrlSpace" },
		},
	},
	{
		"majutsushi/tagbar",
		keys = {
			{ "<F8>", ":TagbarToggle<CR>", desc = "Toggle TagBar", silent = true },
		},
	},
}
