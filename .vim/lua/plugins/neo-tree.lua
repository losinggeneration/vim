-- Map F7 to toggle Neotree
vim.keymap.set("n", "<F7>", ":Neotree toggle<CR>", { silent = true })
-- vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = {
		filesystem = {
			follow_current_file = {
				enabled = true,
			},
			hijack_netrw_behavior = "open_current",
		},
	},
}
