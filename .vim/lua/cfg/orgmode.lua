
local M = {}

function M.config()
	M.setup()
	local cmp = require("cmp")
	local misc = require("cmp.utils.misc")
	vim.pretty_print(cmp.config.sources())
	cmp.setup({
		sources = misc.merge(cmp.config.sources(), {
			{ name = "org" },
		}),
	})

	vim.pretty_print(cmp.config)
end

function M.setup()
	local orgmode = require("orgmode")
	orgmode.setup_ts_grammar()

	require("nvim-treesitter.configs").setup({
		highlight = {
			enable = true,
			disable = { "org" },
			additional_vim_regex_highlighting = { "org" },
		},
		ensure_installed = { "org" },
	})


	orgmode.setup({
		org_agenda_files = { "~/.orgs/**/*" },
		org_default_notes_file = "~/.orgs/note.org",
	})
end

return M
