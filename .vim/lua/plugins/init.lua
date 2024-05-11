return {
	"dstein64/vim-startuptime",

	-- color schemes
	{
		--"gruvbox-community/gruvbox", -- VimScript standard
		"ellisonleao/gruvbox.nvim", -- Treesitter highlighting
		"sainnhe/gruvbox-material", -- VimScript + treesitter support with a softer pallete
		"tomasr/molokai",
		"veloce/vim-aldmeris",
		"bluz71/vim-moonfly-colors",
		"bluz71/vim-nightfly-guicolors",
	},

	-- coding improvments
	{
		"ciaranm/securemodelines",
		"vim-autoformat/vim-autoformat",
		--"is0n/fm-nvim", -- fuzzy finders
	},

	-- snippets used by the snippet plugins
	{
		"Shougo/neosnippet-snippets",
		"honza/vim-snippets",
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
		},
	},

	{
		"neovim/nvim-lspconfig", -- Automatically install LSPs to stdpath for neovim
		"williamboman/mason.nvim",

		{
			"williamboman/mason-lspconfig.nvim",
			config = function()
				require("mason").setup()

				local mason_lspconfig = require("mason-lspconfig")

				-- Ensure the servers are installed
				local servers = {
					clangd = {},
					gopls = {
						gopls = {
							buildFlags = { "-tags", "integration" },
						},
					},
					jsonls = {},
					rust_analyzer = {},
					teal_ls = {},
					tsserver = {},
					zls = {},
					lua_ls = {
						Lua = {
							workspace = {
								checkThirdParty = true,
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.stdpath("config") .. "/lua"] = true,
								},
							},
							completion = {
								enable = true,
								displayContext = true,
								showParams = true,
							},
							telemetry = { enable = false },
						},
					},
				}

				mason_lspconfig.setup({
					ensure_installed = vim.tbl_keys(servers),
				})

				servers.yamlls = {
					yaml = {
						maxItemsComputed = 5000 * 10,
					},
				}

				local wrap = function(fn, ...)
					local arg = ...
					return function()
						fn(arg)
					end
				end

				-- LSP settings.
				--  This function gets run when an LSP connects to a particular buffer.
				local on_attach = function(_, bufnr)
					--print("on_attach")
					local nmap = function(keys, func, desc)
						if desc then
							desc = "LSP: " .. desc
						end

						vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
					end

					vim.b.autoformat = true

					-- Diagnostic keymaps
					nmap("[d", function()
						if not vim.diagnostic.is_disabled(0) and vim.diagnostic.get_prev() ~= nil then
							vim.diagnostic.goto_prev()
						end
					end)
					nmap("]d", function()
						if not vim.diagnostic.is_disabled(0) and vim.diagnostic.get_next() ~= nil then
							vim.diagnostic.goto_next()
						end
					end)

					nmap("<leader>e", vim.diagnostic.open_float)
					nmap("<leader>q", vim.diagnostic.setloclist)
					nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					nmap("<Leader>rf", vim.lsp.buf.format, "[R]e[f]ormat file")
					nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

					nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					nmap(
						"gr",
						wrap(require("telescope.builtin").lsp_references, { jump_type = "never" }),
						"[G]oto [R]eferences"
					)
					nmap(
						"gi",
						wrap(require("telescope.builtin").lsp_implementations, { jump_type = "never" }),
						"[G]oto [I]mplementation"
					)
					nmap(
						"td",
						wrap(require("telescope.builtin").lsp_type_definitions, { jump_type = "never" }),
						"[T]ype [D]efinition"
					)
					nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					nmap(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
					nmap(
						"<leader>fd",
						wrap(require("telescope.builtin").diagnostics, { buffnr = 0 }),
						"[F]ile [D]iagnostics"
					)
					nmap("<leader>ed", function()
						require("telescope.builtin").diagnostics({ severity = "error" })
					end, "[E]rror [D]iagnostics")

					-- See `:help K` for why this keymap
					nmap("K", vim.lsp.buf.hover, "Hover Documentation")
					nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

					-- Lesser used LSP functionality
					nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
					nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
					nmap("<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, "[W]orkspace [L]ist Folders")

					-- Create a command `:Format` local to the LSP buffer
					vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
						vim.lsp.buf.format()
					end, { desc = "Format current buffer with LSP" })

					-- format on save
					vim.api.nvim_create_autocmd({
						"BufWritePre",
						--[[ "InsertLeave", --]]
					}, {
						pattern = "<buffer>",
						callback = function()
							if vim.b.autoformat then
								vim.lsp.buf.format()
							end
						end,
					})
				end

				if completion == "cmp" then
					local capabilities =
						require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
				end

				-- automatic setup for installed servers
				mason_lspconfig.setup_handlers({
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
							on_attach = on_attach,
							settings = servers[server_name],
						})
					end,
				})
			end,
			dependencies = {
				{
					"tamago324/nlsp-settings.nvim",
					--enabled = false,
					config = function()
						require("nlspsettings").setup({
							config_home = vim.fn.stdpath("config") .. "/nlsp-settings",
							local_settings_dir = ".nlsp-settings",
							local_settings_root_markers_fallback = { ".git" },
							append_default_schemas = true,
							loader = "json",
						})
					end,
				},
				{
					"folke/neoconf.nvim",
					enabled = false,
					config = function()
						require("neoconf").setup({
							-- name of the local settings files
							local_settings = ".neoconf.json",
							-- name of the global settings file in your neovim config directory
							global_settings = "neoconf.json",
							-- import existing settinsg from other plugins
							import = {
								vscode = true, -- local .vscode/settings.json
								coc = true, -- global/local coc-settings.json
								nlsp = true, -- global/local nlsp-settings.nvim json settings
							},
							-- send new configuration to lsp clients when changing json settings
							live_reload = true,
							-- set the filetype to jsonc for settings files, so you can use comments
							-- make sure you have the jsonc treesitter parser installed!
							filetype_jsonc = true,
							plugins = {
								-- configures lsp clients with settings in the following order:
								-- - lua settings passed in lspconfig setup
								-- - global json settings
								-- - local json settings
								lspconfig = {
									enabled = true,
								},
								gopls = {
									enabled = true,
								},
								-- configures jsonls to get completion in .nvim.settings.json files
								jsonls = {
									enabled = true,
									-- only show completion in json settings for configured lsp servers
									configured_servers_only = true,
								},
								-- configures lua_ls to get completion of lspconfig server settings
								lua_ls = {
									-- by default, lua_ls annotations are only enabled in your neovim config directory
									enabled_for_neovim_config = true,
									-- explicitely enable adding annotations. mostly relevant to put in your local .nvim.settings.json file
									enabled = true,
								},
							},
						})
					end,
				},
			},
		},

		-- quick fix and other code actions menu
		{
			"weilbith/nvim-code-action-menu",
			cmd = "CodeActionMenu",
		},

		-- vscode-like margin hints
		{
			"kosayoda/nvim-lightbulb",
			dependencies = "antoinemadec/FixCursorHold.nvim",
			config = function()
				require("nvim-lightbulb").setup({
					autocmd = { enabled = true },
					-- virtual_text = { enabled = true },
					-- float = { enabled = true },
					status_text = { enabled = true },
					-- number = { enabled = true },
					-- line = { enabled = true },
				})
				--vim.cmd([[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]])
			end,
		},

		-- Useful status updates for LSP
		{
			"j-hui/fidget.nvim",
			tag = "legacy",
			config = function()
				require("fidget").setup()
			end,
		},
	},

	-- editing improvements
	{
		"christoomey/vim-sort-motion",
		{
			"terryma/vim-expand-region",
			config = function()
				vim.keymap.set("v", "K", "<Plug>(expand_region_expand)")
				vim.keymap.set("v", "J", "<Plug>(expand_region_shrink)")
			end,
		},
		"lukas-reineke/indent-blankline.nvim",
		"tpope/vim-abolish",
		"tpope/vim-repeat",
		"tpope/vim-sensible",
		"tpope/vim-surround",
		--"xolox/vim-misc",
		"AndrewRadev/sideways.vim",
		--"ackyshake/VimCompletesMe",
		"Yggdroot/indentLine",
		"tpope/vim-endwise",
		{
			"ggandor/leap.nvim",
			config = function()
				require("leap").add_default_mappings()
			end,
		},
		{
			"mbbill/undotree",
			config = function()
				vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
			end,
		},
		{
			"tpope/vim-sleuth",
			-- This can cause some issues with file types not respecting the
			-- desired global indentation. This also is what causes the
			-- initial text when nvim is open to go away without input.
			-- Because this also messes with the filetype, it can also
			-- cause color scheme colors to not load correctly.
			enabled = false,
		},

		{
			"nvim-treesitter/nvim-treesitter",
			build = function()
				local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
				ts_update()
			end,
			config = function()
				require("nvim-treesitter.configs").setup({
					ensure_installed = {
						"bash",
						"c",
						"cmake",
						"cpp",
						"css",
						"diff",
						"dockerfile",
						"gitcommit",
						"go",
						"javascript",
						"json",
						"jsonnet",
						"lua",
						"nix",
						"qmljs",
						"rust",
						"scheme",
						"typescript",
						"v",
						"vim",
						"zig",
					},
					auto_install = true,
					incremental_selection = {
						enable = true,
						keymaps = {
							-- mappings for incremental selection (visual mappings)
							init_selection = "gnn", -- maps in normal mode to init the node/scope selection
							node_incremental = "grn", -- increment to the upper named parent
							scope_incremental = "grc", -- increment to the upper scope (as defined in locals.scm)
							node_decremental = "grm", -- decrement to the previous node
						},
					},
					highlight = {
						enable = true,
					},
					indent = {
						enable = true,
					},
				})
			end,
			dependencies = {
				{
					--"nvim-treesitter/nvim-treesitter-textobjects",
					"theHamsta/nvim-treesitter-textobjects",
					branch = "fix-go",
					--enabled = false,
					config = function()
						require("nvim-treesitter.configs").setup({
							textobjects = {
								--syntax-aware textobjects
								enable = true,
								lookahead = true,
								lsp_interop = {
									enable = true,
									peek_definition_code = {
										["<leader>df"] = "@function.outer",
										["<leader>dF"] = "@class.outer",
									},
								},
								keymaps = {
									["iL"] = {
										-- you can define your own textobjects directly here
										go = "(function_definition) @function",
									},
									-- or you use the queries from supported languages with textobjects.scm
									["af"] = "@function.outer",
									["if"] = "@function.inner",
									["aC"] = "@class.outer",
									["iC"] = "@class.inner",
									["ac"] = "@conditional.outer",
									["ic"] = "@conditional.inner",
									["ae"] = "@block.outer",
									["ie"] = "@block.inner",
									["al"] = "@loop.outer",
									["il"] = "@loop.inner",
									["is"] = "@statement.inner",
									["as"] = "@statement.outer",
									["ad"] = "@comment.outer",
									["am"] = "@call.outer",
									["im"] = "@call.inner",
								},
								move = {
									enable = true,
									set_jumps = true, -- whether to set jumps in the jumplist
									goto_next_start = {
										["]m"] = "@class.outer",
										["]]"] = "@function.outer",
									},
									goto_next_end = {
										["]M"] = "@class.outer",
										["]["] = "@function.outer",
									},
									goto_previous_start = {
										["[m"] = "@class.outer",
										["[["] = "@function.outer",
									},
									goto_previous_end = {
										["[M"] = "@class.outer",
										["[]"] = "@function.outer",
									},
								},
								select = {
									enable = true,
									keymaps = {
										-- You can use the capture groups defined in textobjects.scm
										["af"] = "@function.outer",
										["if"] = "@function.inner",
										["ac"] = "@class.outer",
										["ic"] = "@class.inner",
									},
								},
								swap = {
									enable = true,
									swap_next = {
										["<leader>s"] = "@parameter.inner",
									},
									swap_previous = {
										["<leader>S"] = "@parameter.inner",
									},
								},
							},
						})
					end,
				},
			},
		},
	},

	-- UI addition
	{
		"vim-ctrlspace/vim-ctrlspace",
		config = function()
			vim.keymap.set("n", "<c-space>", [[:CtrlSpace<CR>]])
		end,
	},
	{
		"majutsushi/tagbar",
		config = function()
			-- Map F4 to toggle Tagbar
			vim.keymap.set("n", "<F8>", ":TagbarToggle<CR>", { silent = true })
			--vim.keymap.set("i", "<F8>", ":TagbarToggle<CR>")
		end,
	},
	--"scrooloose/nerdcommenter",
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
			local ft = require("Comment.ft")
			ft.set("forth", { "( %s )" })
		end,
	},
	{
		"scrooloose/nerdtree",
		enabled = false,
		config = function()
			-- Map F7 to toggle NERDTree
			vim.keymap.set("n", "<F7>", ":NERDTreeToggle<CR>", { silent = true })
		end,
	},
	{
		"severin-lemaignan/vim-minimap",
		config = function()
			vim.g.minimap_update = "<Leader>mu"
			vim.g.minimap_togle = "<Leader>mt"
			vim.g.minimap_highlight = "Visual"
		end,
	},
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			{ "junegunn/fzf", build = "./install --bin" },
		},
	},

	-- status line replacement
	{},

	--#[[
	{
		"folke/noice.nvim", -- experimental UI overhaul
		enabled = false,
		--event = "VimEnter",
		config = function()
			require("noice").setup()
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			--"rcarriga/nvim-notify",
		},
	},
	--]]
	-- utilities
	{
		"robertbasic/vim-hugo-helper",

		{
			"wthollingsworth/pomodoro.nvim",
			dependencies = {
				"MunifTanjim/nui.nvim",
			},
			config = function()
				require("pomodoro").setup({
					time_work = 25,
					time_break_short = 5,
					time_break_long = 20,
					timers_to_long_break = 4,
				})
			end,
		},

		{
			"nvim-orgmode/orgmode",
			--ft = "org",
			config = function()
				local orgmode = require("orgmode")

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

				local cmp = require("cmp")
				local misc = require("cmp.utils.misc")
				-- vim.print(cmp.config.sources())
				cmp.setup({
					sources = misc.merge(cmp.config.sources(), {
						{ name = "org" },
					}),
				})

				-- vim.print(cmp.config)
			end,
		},
	},

	-- git shit
	{
		{
			"lewis6991/gitsigns.nvim",
			config = function()
				require("gitsigns").setup({
					numhl = true,
					on_attach = function(bufnr)
						local gs = package.loaded.gitsigns

						local function map(mode, l, r, opts)
							opts = opts or {}
							opts.buffer = bufnr
							vim.keymap.set(mode, l, r, opts)
						end

						-- Navigation
						map("n", "]c", function()
							if vim.wo.diff then
								return "]c"
							end
							vim.schedule(function()
								gs.next_hunk()
							end)
							return "<Ignore>"
						end, { expr = true })

						map("n", "[c", function()
							if vim.wo.diff then
								return "[c"
							end
							vim.schedule(function()
								gs.prev_hunk()
							end)
							return "<Ignore>"
						end, { expr = true })

						-- Actions
						map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "git stage hunk" })
						map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "git reset hunk" })
						map("n", "<leader>hS", gs.stage_buffer, { desc = "git stage buffer" })
						map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "git stage hunk" })
						map("n", "<leader>hR", gs.reset_buffer, { desc = "git reset buffer" })
						map("n", "<leader>hp", gs.preview_hunk, { desc = "git preview hunk" })
						map("n", "<leader>hb", function()
							gs.blame_line({ full = true })
						end, { desc = "git blame line" })
						map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "git toggle current line blame" })
						map("n", "<leader>hd", gs.diffthis, { desc = "git diff this" })
						map("n", "<leader>hD", function()
							gs.diffthis("~")
						end, { desc = "" })
						map("n", "<leader>td", gs.toggle_deleted, { desc = "git toggle deleted" })

						-- Text object
						map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
					end,
				})
			end,
		},
		{
			"tpope/vim-fugitive",
			config = function()
				vim.keymap.set("n", "<Leader>Gd", ":Gdiff<cr>")
				vim.keymap.set("n", "<Leader>Gc", ":Git commit<cr>")
				vim.keymap.set("n", "<Leader>Gcv", ":Git commit -v<cr>")
			end,
		},
		"tpope/vim-git",
	},

	-- common languages
	{
		{ "ollykel/v-vim", ft = "vlang" },
		{ "ziglang/zig.vim", ft = "zig" },
		{ "teal-language/vim-teal", ft = "teal" },
		{
			"leafo/moonscript-vim",
			ft = "moon",
			config = function()
				-- Moonscript tools bindings
				vim.keymap.set("n", "<Leader>c", [[:!moonc "%:p"<cr>]])
				vim.keymap.set("n", "<Leader>b", [[:!moonc "%:p:h"<cr>]])
				vim.keymap.set("n", "<Leader>l", [[:!moonc -l "%:p"<cr>]])
			end,
		},

		-- Mostly personal project languages
		{ "rust-lang/rust.vim", ft = "rust" },
		{ "jdonaldson/vaxe", ft = "haxe" },
		{ "jansenm/vim-cmake", ft = "cmake" },
		{ "peterhoeg/vim-qml", ft = "qml" },
		{ "samsaga2/vim-z80" },

		-- SQL
		{
			"mattn/vim-sqlfmt",
			ft = { "sql", "mysql" },
			build = "go install github.com/jackc/sqlfmt/cmd/sqlfmt@latest",
		},
		{ "kristijanhusak/vim-dadbod-ui" },
		{ "tpope/vim-dadbod" },
		{ "chrisbra/csv.vim", ft = "csv" },

		{ "mfussenegger/nvim-dap" }, -- Debug adapter protocol

		-- Python
		{
			{ "vim-scripts/indentpython.vim", ft = "python" },
			{ "nvie/vim-flake8", ft = "python" },
			{ "python-mode/python-mode", branch = "develop", ft = "python" },
		},

		-- Random just in case languages
		{ "elixir-lang/vim-elixir", ft = "elixir" },
		{ "rhysd/vim-crystal", ft = "crystal" },
		{ "derekwyatt/vim-scala", ft = "scala" },

		-- Ruby
		{
			{ "tpope/vim-bundler", ft = "ruby" },
			{ "tpope/vim-rails", ft = "ruby" },
			{ "vim-ruby/vim-ruby", ft = "ruby" },
		},

		{ "fatih/vim-nginx", ft = "nginx" },
		{ "elzr/vim-json", ft = "json" },
		{ "cespare/vim-toml", ft = "toml" },
		{ "maralla/vim-toml-enhance", ft = "toml" },
		{
			"pedrohdz/vim-yaml-folds",
			ft = "yaml",
			config = function()
				vim.o.foldlevelstart = 20
			end,
		},
		{
			"iamcco/markdown-preview.nvim",
			build = "cd app && yarn install",
			ft = { "md", "markdown" },
			config = function()
				vim.keymap.set("n", "<C-s>", "<Plug>MarkdownPreview")
				vim.keymap.set("n", "<M-s>", "<Plug>MarkdownPreviewStop")
				vim.keymap.set("n", "<C-p>", "<Plug>MarkdownPreviewToggle")
			end,
		},
	},

	-- Web dev
	{
		-- Typescript
		--{ "leafgarland/typescript-vim", ft = "typescript" },
		--{ "Quramy/tsuquyomi", ft = "typescript" },

		{ "pangloss/vim-javascript", ft = { "javascript", "javascriptreact", "javascript.jsx" } },
		{
			"MaxMEllon/vim-jsx-pretty",
			ft = { "javascript", "javascriptreact", "javascript.jsx" },
			dependencies = {
				{ "yuezk/vim-js", ft = { "javascript", "javascriptreact", "javascript.jsx" } },
				{ "HerringtonDarkholme/yats.vim", ft = { "typescript", "typescript.tsx" } },
			},
		},
		{
			"mattn/emmet-vim",
			ft = { "javascript", "javascriptreact", "javascript.jsx", "html", "css", "vue" },
		},
		{ "luishdez/vim-less", ft = "less" },

		-- Vue
		{ "leafOfTree/vim-vue-plugin", ft = "vue" },

		{
			"ElmCast/elm-vim",
			ft = "elm",
			config = function()
				vim.keymap.set("n", "<leader>el", ":ElmEvalLine<CR>")
				vim.keymap.set("v", "<leader>es", ":<C-u>ElmEvalSelection<CR>")
				vim.keymap.set("n", "<leader>em", ":ElmMakeCurrentFile<CR>")
			end,
		},
		-- Reason
		--{'reasonml-editor/vim-reason-plus', ft = 'reason' },
		{ "jordwalke/vim-reasonml", ft = "reason" },
		{ "rescript-lang/vim-rescript", ft = "rescript" },

		{ "kchmck/vim-coffee-script", ft = "coffee" },
	},

	-- Mostly employment project languages
	{
		{
			"hashivim/vim-terraform",
			ft = "terraform",
			config = function()
				vim.g.terraform_align = 1
				vim.g.terraform_fmt_on_save = 1
			end,
		},
		{ "cappyzawa/starlark.vim", ft = "starlark" },
		{
			"google/vim-jsonnet",
			config = function()
				vim.g.jsonnet_fmt_on_save = 0
			end,
			ft = "jsonnet",
		},
		{
			-- PHP
			{ "StanAngeloff/php.vim", ft = "php" },
			{ "vim-php/tagbar-phpctags.vim", ft = "php" },
			{
				"phpactor/phpactor",
				tag = "0.18.1",
				build = "composer install --no-dev -o",
				ft = "php",
			},
		},
		{ "aklt/plantuml-syntax", ft = "plantuml" },
	},

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	-- if packer_bootstrap then
	-- 	require("packer").sync()
	-- end
}
