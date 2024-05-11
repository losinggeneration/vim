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
				config = function(opts)
					require("snippy").setup(opts)
				end,
				opts = {
					mappings = {
						is = {
							["<C-k>"] = "expand_or_advance",
							["<C-S-k>"] = "previous",
						},
						nx = {
							["<leader>x"] = "cut_text",
						},
					},
				},
			},

			-- neosnippet -- VimScript SnipMate support (inactive)
			--'notomo/cmp-neosnippet',
			--'Shougo/neosnippet-snippets',

			{
				"petertriho/cmp-git",
				dependencies = "nvim-lua/plenary.nvim",
			},

			-- Nvim API completions
			--{ "hrsh7th/cmp-nvim-lua", ft = { "lua", "vim" } },
			-- Nvim API completions & docs
			{
				"folke/neodev.nvim",
				ft = { "lua", "vim" },
			},

			--'f3fora/cmp-spell', -- spelling suggestions

			{
				"windwp/nvim-autopairs",
				opts = {
					disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },
				},
			},

			{ "reasonml-editor/vim-reason-plus", ft = "reason" },

			{
				"ray-x/go.nvim",
				ft = { "go", "gomod", "gowork", "gotmpl" },

				opts = {
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
				},

				config = function()
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

		opts = {},

		config = function(opts)
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
		opts = {
			lsp = {
				disable_lsp = "all",
			},
		},
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
