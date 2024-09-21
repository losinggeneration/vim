if vim.g.disable_extra_plugins == true then
	return {}
end

-- editing improvements
return {
	{
		"vim-illuminate",
		opts = {
			providers = { "lsp", "treesitter" },
			delay = 100,
			large_file_cutoff = 1500,
			large_file_overrides = {
				providers = { "lsp" },
			},
		},
	},
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

	"norcalli/nvim-colorizer.lua",

	-- LLM
	{
		{
			"David-Kunz/gen.nvim",
			config = function()
				local gen = require("gen")
				gen.prompts["Enhance_Comment"] = {
					prompt = "Elaborate the comment text as a comment. Only ouput the result as a valid comment. Do not elaborate code about the comment. This is for the comment only. This should be in the syntax of $filetype:\n$text",
					replace = true,
				}

				gen.prompts["Add_Comment"] = {
					prompt = "Add comments for the following code. The response should include all the original code with comments. Do not elaborate on or otherwise change the provided code. The code provide is in the syntax of $filetype:\n$text",
					replace = true,
				}

				gen.prompts["Function_Comment"] = {
					prompt = "Add a top level comment for the following function declaration. The response should only be the comment for the function. The code provide is in the syntax of $filetype:\n$text",
				}
			end,
			keys = {
				{ "<Leader>]", ":Gen<cr>", mode = "v", desc = "Gen.ai" },
				{ "<Leader>]", ":Gen<cr>", desc = "Gen.ai" },
			},
		},

		-- 	{
		-- 		"marco-souza/ollero.nvim",
		-- 		dependencies = {
		-- 			"marco-souza/term.nvim",
		-- 			"nvim-telescope/telescope-ui-select.nvim",
		-- 		},
		-- 		config = true,
		-- 	},
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
			{ "<Leader>rf", ":Autoformat<CR>", remap = true, desc = "Reformat file" },
			{ "<Leader>rl", ":AutoformatLine<CR>", desc = "Reformat line" },
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
			"vhyrro/luarocks.nvim",
			priority = 1000, -- We'd like this plugin to load first out of the rest
			config = true, -- This automatically runs `require("luarocks-nvim").setup()`
		},
		{
			"nvim-neorg/neorg",
			-- build = ":Neorg sync-parsers",
			lazy = true, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
			dependencies = {
				-- "nvim-lua/plenary.nvim",
				"vhyrro/luarocks.nvim",
			},
			config = true,
			opts = {
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.summary"] = {},
					["core.completion"] = {
						config = {
							engine = "nvim-cmp",
						},
					},
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
