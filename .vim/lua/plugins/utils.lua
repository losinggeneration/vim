-- utilities
return {
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
	},
}
