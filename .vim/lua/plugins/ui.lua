if vim.g.disable_extra_plugins == true then
	return {}
end

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
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
		},
	},
	{
		"majutsushi/tagbar",
		keys = {
			{ "<F8>", ":TagbarToggle<CR>", desc = "Toggle TagBar", silent = true },
		},
	},
}
