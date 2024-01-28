if vim.g.disable_lazy_plugins == true then
	return {}
end

return {
	"nvim-treesitter/nvim-treesitter",

	opts = {
		ensure_installed = {
			"bash",
			"c",
			"cmake",
			"cpp",
			"css",
			"diff",
			"dockerfile",
			"forth",
			"gitcommit",
			"gitignore",
			"go",
			"gomod",
			"gowork",
			"html",
			"javascript",
			"json",
			"jsonc",
			"jsonnet",
			"lua",
			"luap",
			"luadoc",
			"nix",
			"qmljs",
			"rust",
			"scheme",
			"tsx",
			"typescript",
			"v",
			"vim",
			"zig",
		},
		auto_install = true,

		textobjects = {
			enable = true,
			lsp_interop = {
				enable = true,
				peek_definition_code = {
					["<leader>ck"] = "@function.outer",
					["<leader>cK"] = "@class.outer",
				},
			},
		},
	},
}
