if vim.g.disable_lazy_plugins == true then
	return {}
end

return {
	"nvim-neo-tree/neo-tree.nvim",
	keys = {
		{ "<F7>", ":Neotree toggle<CR>", silent = true },
	},
}
