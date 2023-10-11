-- UI addition
return {
	{
		"vim-ctrlspace/vim-ctrlspace",
		-- enabled = false,
		cmd = "CtrlSpace",
		lazy = true,
		config = function()
			vim.g.CtrlSpaceSetDefaultMapping = 0
		end,
		keys = {
			{ "<leader><space>", [[:CtrlSpace<CR>]], desc = "CtrlSpace" },
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		keys = {
			{ "<leader><space>", false }, -- disable for CtrlSpace
		},
	},
	{
		"majutsushi/tagbar",
		keys = {
			{ "<F8>", ":TagbarToggle<CR>", desc = "Toggle TagBar", silent = true },
		},
	},
}
