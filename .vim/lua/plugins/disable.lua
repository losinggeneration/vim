if vim.g.disable_lazy_plugins == true then
	return {
		{ "cmp-buffer", enabled = false },
		{ "cmp-nvim-lsp", enabled = false },
		{ "cmp-path", enabled = false },
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
		{ "mini.icons", enabled = false },
		{ "neo-tree.nvim", enabled = false },
		{ "noice.nvim", enabled = false },
		{ "nui.nvim", enabled = false },
		{ "nvim-cmp", enabled = false },
		{ "nvim-lint", enabled = false },
		{ "nvim-lspconfig", enabled = false },
		{ "nvim-notify", enabled = false },
		{ "nvim-treesitter", enabled = false },
		{ "nvim-treesitter-textobjects", enabled = false },
		{ "nvim-ts-autotag", enabled = false },
		{ "persistence.nvim", enabled = false },
		{ "plenary.nvim", enabled = false },
		{ "telescope-fzf-native.nvim", enabled = false },
		{ "telescope.nvim", enabled = false },
		{ "todo-comments.nvim", enabled = false },
		{ "trouble.nvim", enabled = false },
		{ "which-key.nvim", enabled = false },
		{ "grug-far.nvim", enabled = false },
		{ "catppuccin/nvim", enabled = false },
		{ "luvit-meta", enabled = false },
		{ "tokyonight.nvim", enabled = false },
		{ "ts-comments.nvim", enabled = false },
		{ "lazydev.nvim", enabled = false },
	}
end

return {
	-- slueth can cause some issues with file types not respecting the desired
	-- global indentation. This also is what causes the initial text when nvim
	-- is open to go away without input. Because this also messes with the
	-- filetype, it can also cause color scheme colors to not load correctly.
	{ "tpope/vim-sleuth", enabled = false },
	{ "bufferline.nvim", enabled = false },
	{ "mini.pairs", enabled = false },
}
