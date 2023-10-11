-- editing improvements
return {
	"ciaranm/securemodelines",
	"sQVe/sort.nvim",
	"tpope/vim-abolish",
	"tpope/vim-repeat",
	"tpope/vim-sensible",
	"tpope/vim-surround",
	-- "lukas-reineke/indent-blankline.nvim",
	--"xolox/vim-misc",
	{
		"AndrewRadev/sideways.vim",
		keys = {
			{ "<Leader>csl", ":SidewaysLeft<CR>", desc = "<- sideways" },
			{ "<Leader>csr", ":SidewaysRight<CR>", desc = "sideways ->" },
		},
	},
	"tpope/vim-endwise",
	{
		"mbbill/undotree",
		cmd = "UndooTree",

		keys = {
			{ "<leader>uu", vim.cmd.UndotreeToggle, desc = "UndoTree Toggle" },
		},
	},

	-- coding improvments
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
	{
		"vim-autoformat/vim-autoformat",
		keys = {
			-- { "<Leader>rf", ":Autoformat<CR>", remap = true },
			-- { "<Leader>rfl", ":AutoformatLine<CR>" },
		},
	},
	{
		"windwp/nvim-autopairs",
		opts = {
			disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },
		},
	},

	{
		"robertbasic/vim-hugo-helper",

		{
			"wthollingsworth/pomodoro.nvim",
			dependencies = {
				"MunifTanjim/nui.nvim",
			},
			opts = {
				time_work = 25,
				time_break_short = 5,
				time_break_long = 20,
				timers_to_long_break = 4,
			},
		},

		{
			"nvim-orgmode/orgmode",
			enabled = false,
			--ft = "org",
			dependencies = {
				"nvim-treesitter/nvim-treesitter",
			},
			opts = {
				org_agenda_files = { "~/.orgs/**/*" },
				org_default_notes_file = "~/.orgs/note.org",
			},
			config = function(_, opts)
				local om = require("orgmode")
				om.setup_ts_grammar()

				om.setup(opts)
			end,
		},

		{
			"nvim-neorg/neorg",
			build = ":Neorg sync-parsers",
			dependencies = { "nvim-lua/plenary.nvim" },
			opts = {
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							default_workspace = "notes",
							workspaces = {
								notes = "~/Documents/notes/neorg",
							},
						},
					},
				},
			},
		},
	},
}
