local init = function()
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local telescope_custom_actions = {}

	function telescope_custom_actions._multiopen(prompt_bufnr, open_cmd)
		local picker = action_state.get_current_picker(prompt_bufnr)
		local num_selections = #picker:get_multi_selection()
		if not num_selections or num_selections <= 1 then
			actions.add_selection(prompt_bufnr)
		end

		actions.send_selected_to_qflist(prompt_bufnr)
		vim.cmd("cfdo " .. open_cmd)
	end

	function telescope_custom_actions.multi_selection_open_vsplit(prompt_bufnr)
		telescope_custom_actions._multiopen(prompt_bufnr, "vsplit")
	end

	function telescope_custom_actions.multi_selection_open_split(prompt_bufnr)
		telescope_custom_actions._multiopen(prompt_bufnr, "split")
	end

	function telescope_custom_actions.multi_selection_open_tab(prompt_bufnr)
		telescope_custom_actions._multiopen(prompt_bufnr, "tabe")
	end

	function telescope_custom_actions.multi_selection_open(prompt_bufnr)
		telescope_custom_actions._multiopen(prompt_bufnr, "edit")
	end

	local i = {
		["<CR>"] = telescope_custom_actions.multi_selection_open,
		["<C-V>"] = telescope_custom_actions.multi_selection_open_vsplit,
		["<C-S>"] = telescope_custom_actions.multi_selection_open_split,
		["<C-T>"] = telescope_custom_actions.multi_selection_open_tab,
		["<C-DOWN>"] = require("telescope.actions").cycle_history_next,
		["<C-UP>"] = require("telescope.actions").cycle_history_prev,
	}

	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")

	-- See `:help telescope.builtin`
	vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
	vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
	vim.keymap.set("n", "<leader>/", function()
		-- You can pass additional configuration to telescope to change theme, layout, etc.
		builtin.current_buffer_fuzzy_find(themes.get_dropdown({
			winblend = 10,
			previewer = false,
		}))
	end, { desc = "[/] Fuzzily search in current buffer]" })

	vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
	vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
	vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
	vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
	vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
	vim.keymap.set("n", "<leader>ss", builtin.symbols, { desc = "[S]earch [S]ymbols" })
	vim.keymap.set("n", "<leader>qf", builtin.quickfix, { desc = "[Q]uick [F]ix" })
	vim.keymap.set("n", "<leader>ts", builtin.treesitter, { desc = "[T]ree[s]itter" })
end

return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	init = init,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = {
		defaults = {
			mappings = {
				i = i,
				n = i,
			},
		},
	},
}
