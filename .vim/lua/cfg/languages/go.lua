local M = {}

-- Use go.nvim
function M.nvim()
	require("go").setup({
		-- goimport = "gopls", -- if set to 'gopls' will use golsp format
		-- gofmt = "gofumpt", -- if set to gopls will use golsp format
		max_line_len = 120,
		tag_transform = false,
		test_dir = "",
		comment_placeholder = " 	",
		lsp_cfg = true, -- false: use your own lspconfig
		--[[
		lsp_cfg = { -- false: use your own lspconfig
			settings = {
				["go.buildTags"] = "integration",
				gopls = {
					usePlaceholders = false,
				},
			},
		},
		--]]
		lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
		lsp_on_attach = true, -- use on_attach from go.nvim
		dap_debug = true,
	})

	-- run goimports on save & exiting insert mode
	-- On InsertLeave might be slightly annoying because, unlike on save, it
	-- doesn't preseve the cursor location
	vim.api.nvim_create_autocmd({ "InsertLeave" }, {
		pattern = "<buffer>",
		callback = function()
			require("go.format").goimport()
			require("go.format").org_imports(500)
			--require("go.format").gofmt()
		end,
	})

	vim.keymap.set("n", "<Leader>a", ":GoAlt<cr>")

	-- vim-go keys ported to go.nvim
	vim.keymap.set("n", "<Leader>b", ":GoBuild<cr>")
	vim.keymap.set("n", "<Leader>f", ":GoFmt<cr>")
	vim.keymap.set("n", "<Leader>l", ":GoLint<cr>")
	vim.keymap.set("n", "<Leader>t", ":GoTest -p<cr>")
	vim.keymap.set("n", "<Leader>tf", ":GoTestFunc<cr>")
	vim.keymap.set("n", "<Leader>tc", ":GoCoverage<cr>")
	vim.keymap.set("n", "<Leader>tct", ":GoCoverage -t<cr>")
	vim.keymap.set("n", "<Leader>tcc", ":GoCoverage -R<cr>")
	vim.keymap.set("n", "<Leader>v", ":GoVet<cr>")
	vim.keymap.set("n", "<Leader>d", ":GoDoc<cr>")
	vim.keymap.set("n", "<Leader>r", ":GoRename<cr>")
	vim.keymap.set("n", "<Leader>s", ":GoImpl<cr>")
	vim.keymap.set("n", "<Leader>y", ":GoRun<cr>")
	vim.keymap.set("n", "<Leader>a", ":GoAlt<cr>")
end

-- disable all default options from vim-go that are by default enabled
function M.nvim_go()
	vim.g.go_version_warning = 0
	vim.g.go_code_completion_enabled = 0
	vim.g.go_play_open_browser = 0
	vim.g.go_jump_to_error = 0
	vim.g.go_fmt_autosave = 0
	vim.g.go_doc_keywordprg_enabled = 0
	vim.g.go_def_mapping_enabled = 0
	vim.g.go_search_bin_path_first = 0
	vim.g.go_get_update = 0
	vim.g.go_textobj_enabled = 0
	vim.g.go_textobj_include_function_doc = 0
	vim.g.go_textobj_include_variable = 0
	vim.g.go_term_close_on_exit = 0
	vim.g.go_gopls_enabled = 0
	vim.g.go_template_autocreate = 0
	vim.g.go_echo_command_info = 0
	vim.g.go_echo_go_info = 0
	vim.g.go_highlight_string_spellcheck = 0
	vim.g.go_highlight_diagnostic_errors = 0
	vim.g.go_highlight_diagnostic_warnings = 0
end

-- Using vim-go options
function M.vim()
	-- Use goimports for Fmt
	vim.g.go_fmt_command = "goimports"
	vim.g.go_fmt_autosave = 1
	vim.g.go_mod_fmt_autosave = 1
	vim.g.go_fmt_fail_silently = 1
	-- this will restore folds and attempt to preserve undo history
	vim.g.go_fmt_experimental = 1

	vim.g.go_rename_command = "gopls"
	vim.g.go_gopls_enabled = 1
	vim.g.go_code_completion_enabled = 1

	vim.g.go_metalinter_autosave = 0
	vim.g.go_metalinter_autosave_enabled = { "vet", "vetshadow", "errcheck", "ineffassign", "gotype", "gofmt" }
	--vim.g.go_metalinter_command = '--tests -D golint -D lll'
	--vim.g.go_metalinter_command = 'gometalinter --enable-all --tests -D golint -D lll -E errcheck'
	vim.g.go_metalinter_disabled = { "golint" }
	--vim.g.go_metalinter_enabled = ['deadcode', 'dupl', 'errcheck', 'gochecknoglobals', 'gochecknoinits', 'goconst', 'gocyclo', 'gofmt', 'goimports', 'golint', 'gosec', 'gotypex', 'ineffassign', 'interfacer', 'maligned', 'misspell', 'nakedret', 'safesql', 'staticcheck', 'structcheck', 'test', 'testify', 'unconvert', 'unparam', 'varcheck', 'vet', 'vetshadow']
	vim.g.go_metalinter_enabled = { "all" }
	--vim.g.go_metalinter_enabled = ['deadcode', 'dupl', 'errcheck', 'gochecknoglobals', 'gochecknoinits', 'goconst', 'gocyclo', 'gofmt', 'goimports', 'govet', 'gosec', 'ineffassign', 'interfacer', 'maligned', 'misspell', 'nakedret', 'staticcheck', 'structcheck', 'unconvert', 'unparam', 'varcheck', 'vet', 'vetshadow']
	vim.g.go_metalinter_deadline = "30s"

	--vim.g.go_auto_sameids = 1
	vim.g.go_auto_type_info = 1
	vim.g.go_list_type = "quickfix"
	vim.g.go_info_mode = "gopls"
	vim.g.go_def_mode = "gopls"

	-- echodoc does better than this
	vim.g.go_echo_go_info = 0
	--
	-- This stops autocomplete preview/tip & autoinserting text
	vim.opt.completeopt = "menu,noinsert,noselect"

	vim.g.go_template_use_pkg = 1

	-- Enable syntax-highlighting for Functions, Methods and Structs.
	vim.g.go_highlight_functions = 1
	vim.g.go_highlight_function_calls = 1
	vim.g.go_highlight_fields = 1
	vim.g.go_highlight_types = 1
	vim.g.go_highlight_build_constraints = 1
	-- May become sluggish with these three
	vim.g.go_highlight_structs = 0
	vim.g.go_highlight_interfaces = 0
	vim.g.go_highlight_operators = 0

	-- Use automatic detection
	--vim.g.go_snippet_engine = 'neosnippet'

	--[[
		function! go#UpdateTags(start, end, count, ...) abort
		call call("go#tags#Remove", [a:start, a:end, a:count] + a:000)
		call call("go#tags#Add", [a:start, a:end, a:count] + a:000)
		endfunction

		command! -nargs=* -range GoUpdateTags call go#UpdateTags(<line1>, <line2>, <count>, <f-args>)
		--]]
	-- Use indent mode for folding
	--setlocal foldmethod=indent
	vim.api.nvim_set_option_value("foldmethod", "indent", { scope = "local" })

	-- Go tools bindings
	vim.keymap.set("n", "<Leader>b", "<Plug>(go-build)")
	vim.keymap.set("n", "<Leader>f", ":GoFmt<cr>")
	vim.keymap.set("n", "<Leader>c", "<Plug>(go-callees)")
	vim.keymap.set("n", "<Leader>cr", "<Plug>(go-callers)")
	vim.keymap.set("n", "<Leader>cs", "<Plug>(go-callstack)")
	vim.keymap.set("n", "<Leader>l", "<Plug>(go-metalinter)")
	vim.keymap.set("n", "<Leader>t", "<Plug>(go-test)")
	vim.keymap.set("n", "<Leader>tf", "<Plug>(go-test-func)")
	vim.keymap.set("n", "<Leader>tc", "<Plug>(go-coverage)")
	vim.keymap.set("n", "<Leader>tct", "<Plug>(go-coverage-toggle)")
	vim.keymap.set("n", "<Leader>tcc", "<Plug>(go-coverage-clear)")
	vim.keymap.set("n", "<Leader>v", "<Plug>(go-vet)")
	vim.keymap.set("n", "<Leader>d", "<Plug>(go-doc)")
	vim.keymap.set("n", "<Leader>gi", "<Plug>(go-install)")
	vim.keymap.set("n", "<Leader>i", "<Plug>(go-info)")
	vim.keymap.set("n", "<Leader>r", "<Plug>(go-rename)")
	vim.keymap.set("n", "<Leader>ref", "<Plug>(go-referrers)")
	vim.keymap.set("n", "<Leader>s", "<Plug>(go-implements)")
	vim.keymap.set("n", "<Leader>y", "<Plug>(go-run)")
	vim.keymap.set("n", "<Leader>if", "<Plug>(go-iferr)")
	vim.keymap.set("n", "<Leader>a", ":GoAlternate<cr>")
	vim.keymap.set("n", "<Leader>si", ":GoSameIds<cr>")
	vim.keymap.set("n", "<Leader>sic", ":GoSameIdsClear<cr>")
	--vim.keymap.set("n", "gd", "<Plug>(go-def)")

	vim.keymap.set("n", "<Leader>ds", "<Plug>(go-def-split)")
	vim.keymap.set("n", "<Leader>dv", "<Plug>(go-def-vertical)")
	vim.keymap.set("n", "<Leader>dt", "<Plug>(go-def-tab)")
	vim.keymap.set("n", "<Leader>dp", "<Plug>(go-deps)")
	vim.keymap.set("n", "<Leader>df", "<Plug>(go-files)")

	--vim.keymap.set("n", "<Leader>gd", "<Plug>(go-doc)")
	vim.keymap.set("n", "<Leader>gv", "<Plug>(go-doc-vertical)")
end

function M.deoplete()
	vim.fn["deoplete#custom#option"]("omni_patterns", { go = "[^. *\\t]\\.\\w*" })
end

return M
