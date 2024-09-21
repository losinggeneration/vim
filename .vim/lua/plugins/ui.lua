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

	{
		"nvim-neo-tree/neo-tree.nvim",
		keys = {
			{ "<F7>", ":Neotree toggle<CR>", silent = true },
		},
	},
	{
		"mbbill/undotree",
		cmd = "UndooTree",

		keys = {
			{ "<leader>uu", vim.cmd.UndotreeToggle, desc = "UndoTree Toggle" },
		},
	},

	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-;>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
}
