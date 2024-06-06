if vim.g.disable_lazy_plugins == true then
	return {
		{ "LuaSnip", enabled = false },
		{ "bufferline.nvim", enabled = false },
		{ "cmp-buffer", enabled = false },
		{ "cmp-nvim-lsp", enabled = false },
		{ "cmp-path", enabled = false },
		{ "cmp_luasnip", enabled = false },
		{ "conform.nvim", enabled = false },
		{ "dashboard-nvim", enabled = false },
		{ "dressing.nvim", enabled = false },
		{ "flash.nvim", enabled = false },
		{ "gitsigns.nvim", enabled = false },
		{ "indent-blankline.nvim", enabled = false },
		{ "lualine.nvim", enabled = false },
		{ "mason-lspconfig.nvim", enabled = false },
		{ "mason.nvim", enabled = false },
		{ "mini.ai", enabled = false },
		{ "mini.bufremove", enabled = false },
		{ "mini.comment", enabled = false },
		{ "mini.indentscope", enabled = false },
		{ "mini.pairs", enabled = false },
		{ "mini.surround", enabled = false },
		{ "neo-tree.nvim", enabled = false },
		{ "neoconf.nvim", enabled = false },
		{ "neodev.nvim", enabled = false },
		{ "noice.nvim", enabled = false },
		{ "nui.nvim", enabled = false },
		{ "nvim-cmp", enabled = false },
		{ "nvim-lint", enabled = false },
		{ "nvim-lspconfig", enabled = false },
		{ "nvim-notify", enabled = false },
		{ "nvim-spectre", enabled = false },
		{ "nvim-treesitter", enabled = false },
		{ "nvim-treesitter-context", enabled = false },
		{ "nvim-treesitter-textobjects", enabled = false },
		{ "nvim-ts-autotag", enabled = false },
		{ "nvim-ts-context-commentstring", enabled = false },
		{ "nvim-web-devicons", enabled = false },
		{ "persistence.nvim", enabled = false },
		{ "plenary.nvim", enabled = false },
		{ "telescope-fzf-native.nvim", enabled = false },
		{ "telescope.nvim", enabled = false },
		{ "todo-comments.nvim", enabled = false },
		{ "trouble.nvim", enabled = false },
		{ "vim-illuminate", enabled = false },
		{ "which-key.nvim", enabled = false },
	}
end

return {
	-- slueth can cause some issues with file types not respecting the desired
	-- global indentation. This also is what causes the initial text when nvim
	-- is open to go away without input. Because this also messes with the
	-- filetype, it can also cause color scheme colors to not load correctly.
	{ "tpope/vim-sleuth", enabled = false },
	{ "akinsho/bufferline.nvim", enabled = false },
	{ "echasnovski/mini.pairs", enabled = false },
	{ "echasnovski/mini.comment", enabled = false },
	{ "nvimtools/none-ls.nvim", enabled = false },
	{ "lualine.nvim", opts = { theme = "gruvbox-material" } },
	-- deprecated, disabed manually until LazyVim catches up and replaces it
	-- with lazydev.nvim
	{ "neodev.nvim", enabled = false },
}
