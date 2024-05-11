local completion = "cmp" -- one of ['deoplete', 'cmp'] or unset

-- Deoplete completion
if completion == "deoplete" then
	return {
		"Shougo/deoplete.nvim",
		tag = "6.1",
		build = ":UpdateRemotePlugins",
		config = function()
			vim.g["deoplete#enable_at_startup"] = 1

			-- go options
			vim.g["deoplete.sources.go.gocode_binary"] = vim.env.HOME .. "/Programs/bin/gocode"
			vim.g["deoplete.sources.go.sort_class"] = { "package", "func", "type", "var", "const" }
			vim.g["deoplete.sources.go.pointer"] = 1
			vim.g["deoplete.sources.go.use_cache"] = 1
			vim.g["deoplete.sources.go.json_directory"] = vim.env.HOME .. "/.deoplete/cache/go"
			vim.g["deoplete.sources.go.cgo"] = 0

			-- rust options
			vim.g["deoplete.sources#rust.racer_binary"] = vim.env.HOME .. "/.cargo/bin/racer"
			vim.g["deoplete.sources.rust.rust_source_path"] = "/usr/src/rust/src"
		end,
		dependencies = {
			{
				"Shougo/neosnippet",
				config = function()
					vim.g["neosnippet#enable_completed_snippet"] = 1

					-- Plugin key-mappings.
					-- Note: It must be "imap" and "smap".  It uses <Plug> mappings.
					vim.keymap.set({ "i", "s" }, "<C-k>", "<Plug>(neosnippet_expand_or_jump)")
					vim.keymap.set("x", "<C-k>", "<Plug>(neosnippet_expand_target)")

					-- SuperTab like snippets behavior.
					vim.keymap.set("s", "<expr><TAB>", function()
						return vim.cmd["neosnippet#expandable_or_jumpable"]() and "<Plug>(neosnippet_expand_or_jump)"
							or "<TAB>"
					end)

					-- For conceal markers.
					if vim.conceal then
						vim.o.conceallevel = 2
						vim.o.concealcursor = "niv"
					end
				end,
			},
			-- deoplete code completion language support
			{ "zchee/deoplete-zsh", ft = "zsh" },
			{ "Shougo/neco-vim", ft = "vim" },
			{ "zchee/deoplete-jedi", ft = "python" },

			{
				"carlitux/deoplete-ternjs",
				build = "yarn global add tern",
				ft = { "javascript", "javascriptreact", "javascript.jsx" },
			},
			{ "wokalski/autocomplete-flow", ft = { "javascript", "javascriptreact", "javascript.jsx" } },

			{
				"zchee/deoplete-go",
				build = "make",
				ft = { "go", "gomod", "gowork", "gotmpl" },
			},
			{ "sebastianmarkow/deoplete-rust", ft = "rust" },

			{ "slashmili/alchemist.vim", ft = "elixir" },

			{
				"pbogut/deoplete-elm",
				build = "yarn global add elm-oracle",
				ft = "elm",
			},
			{ "reasonml-editor/vim-reason-plus", ft = "reason" },
			{ "kristijanhusak/deoplete-phpactor", ft = "php" },
			{
				"fatih/vim-go",
				build = ":GoInstallBinaries",
				ft = { "go", "gomod", "gowork", "gotmpl" },
				config = function()
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
					vim.g.go_metalinter_autosave_enabled =
						{ "vet", "vetshadow", "errcheck", "ineffassign", "gotype", "gofmt" }
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
					vim.fn["deoplete#custom#option"]("omni_patterns", { go = "[^. *\\t]\\.\\w*" })
				end,
			},
		},
	}
end

-- CMP completion
if completion == "cmp" then
	return {
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				"hrsh7th/cmp-nvim-lsp", -- LSP integration source
				"hrsh7th/cmp-buffer", -- open buffer suggestions source
				"hrsh7th/cmp-path", -- filesystem paths source
				"hrsh7th/cmp-cmdline", -- command line suggestions source
				"hrsh7th/cmp-omni", -- Vim's omnifunc source
				"rcarriga/cmp-dap", -- Debug Adapter Protocol source

				-- vsnip -- VimScript VSCode snippets
				--"hrsh7th/cmp-vsnip",
				--"hrsh7th/vim-vsnip",
				--"hrsh7th/vim-vsnip-integ",

				-- luasnip -- Lua snippets with lsp-syntax support
				--"saadparwaiz1/cmp_luasnip",
				--"L3MON4D3/LuaSnip",

				-- ultasnips -- Python snippets engine
				--"quangnguyen30192/cmp-nvim-ultisnips",
				--"SirVer/ultisnips",

				-- snippy -- Lua minimal snippets with SnipMate support
				{
					"dcampos/cmp-snippy",
					dependencies = "dcampos/nvim-snippy",
					config = function()
						require("snippy").setup({
							mappings = {
								is = {
									["<C-k>"] = "expand_or_advance",
									["<C-S-k>"] = "previous",
								},
								nx = {
									["<leader>x"] = "cut_text",
								},
							},
						})
					end,
				},

				-- neosnippet -- VimScript SnipMate support (inactive)
				--'notomo/cmp-neosnippet',
				--'Shougo/neosnippet-snippets',

				{
					"petertriho/cmp-git",
					dependencies = "nvim-lua/plenary.nvim",
					config = function()
						require("cmp_git").setup()
					end,
				},

				-- Nvim API completions
				--{ "hrsh7th/cmp-nvim-lua", ft = { "lua", "vim" } },
				-- Nvim API completions & docs
				{
					"folke/neodev.nvim",
					ft = { "lua", "vim" },
					config = function()
						require("neodev").setup()
					end,
				},

				--'f3fora/cmp-spell', -- spelling suggestions

				{
					"windwp/nvim-autopairs",
					config = function()
						require("nvim-autopairs").setup({
							disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },
						})
					end,
				},

				{ "reasonml-editor/vim-reason-plus", ft = "reason" },

				{
					"ray-x/go.nvim",
					ft = { "go", "gomod", "gowork", "gotmpl" },
					config = function()
						require("go").setup({
							-- goimport = "gopls", -- if set to 'gopls' will use golsp format
							-- gofmt = "gofumpt", -- if set to gopls will use golsp format
							-- max_line_len = 120,
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
					end,
				},
			},
			config = function()
				-- Setup nvim-cmp.
				local cmp = require("cmp")
				local snippy = require("snippy")

				local function has_words_before()
					local line, col = unpack(vim.api.nvim_win_get_cursor(0))
					return col ~= 0
						and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
				end

				vim.opt.completeopt = { "menu,noinsert,noselect" }

				cmp.setup({
					preselect = cmp.PreselectMode.None,
					snippet = {
						-- REQUIRED - you must specify a snippet engine
						expand = function(args)
							--require("luasnip").lsp_expand(args.body) -- For luasnip users.
							snippy.expand_snippet(args.body) -- For snippy users.
						end,
					},
					window = {
						completion = cmp.config.window.bordered(),
						documentation = cmp.config.window.bordered(),
					},
					mapping = cmp.mapping.preset.insert({
						["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
						["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
						["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
						["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
						["<C-e>"] = cmp.mapping({
							i = cmp.mapping.abort(),
							c = cmp.mapping.close(),
						}),
						-- Accept currently selected item. If none selected, `select` first item.
						-- Set `select` to `false` to only confirm explicitly selected items.
						["<CR>"] = cmp.mapping.confirm({ select = false }),
						["<Tab>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_next_item()
							elseif snippy.can_expand() then
								snippy.expand()
							elseif snippy.can_expand_or_advance() then
								snippy.expand_or_advance()
							elseif has_words_before() then
								cmp.complete()
							else
								fallback()
							end
						end, { "i", "s" }),
						["<S-Tab>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_prev_item()
							elseif snippy.can_jump(-1) then
								snippy.previous()
							else
								fallback()
							end
						end, { "i", "s" }),
					}),
					sources = cmp.config.sources({
						{ name = "nvim_lua" },
						{ name = "nvim_lsp" },
						-- { name = 'spell' },

						-- snippets
						--{ name = "luasnip" }, -- For luasnip users.
						{ name = "snippy" }, -- For snippy users.

						{ name = "git" },
						{ name = "buffer" },
					}, {
						{ name = "buffer" },
					}),
				})

				cmp.setup.filetype("gitcommit", {
					sources = cmp.config.sources({
						{ name = "cmp_git" },
					}, {
						{ name = "buffer" },
					}),
				})

				-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
				cmp.setup.cmdline({ "/", "?" }, {
					mapping = cmp.mapping.preset.cmdline(),
					sources = {
						{ name = "buffer" },
					},
				})

				-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
				cmp.setup.cmdline(":", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = cmp.config.sources({
						{ name = "path" },
					}, {
						{ name = "cmdline" },
					}),
				})

				if vim.o.ft == "clap_input" and vim.o.ft == "guihua" and vim.o.ft == "guihua_rust" then
					require("cmp").setup.buffer({ completion = { enable = false } })
				end

				-- or with autocmd
				vim.cmd("autocmd FileType guihua lua require('cmp').setup.buffer { enabled = false }")
				vim.cmd("autocmd FileType guihua_rust lua require('cmp').setup.buffer { enabled = false }")
			end,
		},

		{
			"kristijanhusak/vim-dadbod-completion",
			dependencies = {
				"hrsh7th/nvim-cmp",
			},
			ft = { "sql", "mysol", "plsql" },
			config = function()
				require("cmp").setup.buffer({
					sources = { {
						name = "vim-dadbod-completion",
					} },
				})
			end,
		},
		{
			"nvim-neotest/neotest",
			cmd = "Netest",
			ft = "go",
			dependencies = {
				-- test adapters here
				{
					"nvim-neotest/neotest-go",
					ft = "go",
				},
			},
			config = function()
				-- get neotest namespace (api call creates or returns namespace)
				local neotest_ns = vim.api.nvim_create_namespace("neotest")
				vim.diagnostic.config({
					virtual_text = {
						format = function(diagnostic)
							local message =
								diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
							return message
						end,
					},
				}, neotest_ns)
				require("neotest").setup({
					adapters = {
						require("neotest-go"),
					},
				})
				vim.keymap.set("n", "<leader>ngt", require("neotest").run.run)
			end,
		},
		{
			"ray-x/navigator.lua", -- LSP code navigation
			dependencies = {
				"ray-x/guihua.lua", -- GUI utils, not completions
				build = "cd lua/fzy && make",
				config = function()
					require("guihua.maps").setup({})
				end,
			},
			config = function()
				require("navigator").setup({
					lsp = {
						disable_lsp = "all",
					},
				})
			end,
		},

		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = vim.fn.executable("make") == 1,
		},

		{
			"folke/trouble.nvim",
			dependencies = "nvim-tree/nvim-web-devicons",
		},

		{
			"jose-elias-alvarez/null-ls.nvim", -- inject LSP diagnostics, code acitons, etc
			dependencies = {
				"nvim-lua/plenary.nvim",
				"ThePrimeagen/refactoring.nvim",
			},
			config = function()
				local null_ls = require("null-ls")

				null_ls.setup({
					debug = false,
					sources = {
						-- Code Actions
						null_ls.builtins.code_actions.eslint,
						--null_ls.builtins.code_actions.gitsigns, -- Git actions at position
						null_ls.builtins.code_actions.gomodifytags,
						null_ls.builtins.code_actions.refactoring,
						null_ls.builtins.code_actions.shellcheck,

						-- Completion
						--null_ls.builtins.completion.luasnip, -- luasnip completion
						--null_ls.builtins.completion.vsnip, -- vsnip completion
						--null_ls.builtins.completion.spell, -- completion for spelling
						null_ls.builtins.completion.tags, -- completion for tags

						-- Linters
						--null_ls.builtins.diagnostics.cspell, -- code spell checker
						null_ls.builtins.diagnostics.clang_check, -- C/C++ check with clang-check
						null_ls.builtins.diagnostics.eslint, -- Typescript check with eslint
						null_ls.builtins.diagnostics.gitlint, -- Git commit messages linter
						null_ls.builtins.diagnostics.golangci_lint.with({
							args = function(params)
								return {
									"run",
									params.bufname,
									"--fix=false",
									"--enable-all",
									"--fast",
									"--out-format=json",
									"--path-prefix",
									"$ROOT",
									"--max-issues-per-linter",
									"0",
								}
							end,
						}), -- Go Lint
						null_ls.builtins.diagnostics.hadolint, -- Dockerfile best practices
						null_ls.builtins.diagnostics.jsonlint, -- JSON lint
						--null_ls.builtins.diagnostics.luacheck, -- Lua linter
						--null_ls.builtins.diagnostics.revive, -- Go linter
						--null_ls.builtins.diagnostics.selene, -- Lua linter
						null_ls.builtins.diagnostics.staticcheck, -- Go linter
						null_ls.builtins.diagnostics.teal, -- Teal linter
						null_ls.builtins.diagnostics.tsc, -- Typescript check with the compiler
						null_ls.builtins.diagnostics.yamllint,
						null_ls.builtins.diagnostics.zsh,

						-- Formatters
						null_ls.builtins.formatting.asmfmt,
						null_ls.builtins.formatting.cljstyle, -- Clojure fmt
						null_ls.builtins.formatting.cmake_format,
						null_ls.builtins.formatting.dfmt, -- D fmt
						null_ls.builtins.formatting.elm_format,
						null_ls.builtins.formatting.goimports, -- Go update imports
						null_ls.builtins.formatting.gofumpt, -- Go fmt
						null_ls.builtins.formatting.jq,
						null_ls.builtins.formatting.prettier, -- Typescript with prettier
						null_ls.builtins.formatting.prettierd, -- yaml with prettier
						null_ls.builtins.formatting.rustfmt,
						null_ls.builtins.formatting.stylua,
						null_ls.builtins.formatting.trim_whitespace, -- Remove junk whitespace
						null_ls.builtins.formatting.zigfmt,
					},
				})
			end,
		},
	}
end
