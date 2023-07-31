local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

local completion = "cmp" -- one of ['deoplete', 'cmp'] or unset

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- color schemes
	use({
		--"gruvbox-community/gruvbox", -- VimScript standard
		"ellisonleao/gruvbox.nvim", -- Treesitter highlighting
		"sainnhe/gruvbox-material", -- VimScript + treesitter support with a softer pallete
		"tomasr/molokai",
		"veloce/vim-aldmeris",
		"bluz71/vim-moonfly-colors",
		"bluz71/vim-nightfly-guicolors",
	})

	-- coding improvments
	use({
		"ciaranm/securemodelines",
		"vim-autoformat/vim-autoformat",
		--"is0n/fm-nvim", -- fuzzy finders
	})

	-- snippets used by the snippet plugins
	use({
		"Shougo/neosnippet-snippets",
		"honza/vim-snippets",
	})

	use({
		"neovim/nvim-lspconfig", -- Automatically install LSPs to stdpath for neovim
		"williamboman/mason.nvim",

		{
			"williamboman/mason-lspconfig.nvim",
			config = function()
				require("cfg.mason-lspconfig")
			end,
		},

		-- quick fix and other code actions menu
		{
			"weilbith/nvim-code-action-menu",
			cmd = "CodeActionMenu",
		},

		-- vscode-like margin hints
		{
			"kosayoda/nvim-lightbulb",
			requires = "antoinemadec/FixCursorHold.nvim",
			config = function()
				vim.cmd([[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]])
			end,
		},

		-- Per-project settings
		{
			"folke/neoconf.nvim",
			before = { "neovim/nvim-lspconfig", "williamboman/mason-lspconfig.nvim" },
			disable = true,
			config = function()
				require("cfg.neoconf")
			end,
		},

		{
			"tamago324/nlsp-settings.nvim",
			--disable = true,
			before = { "neovim/nvim-lspconfig", "williamboman/mason-lspconfig.nvim" },
			config = function()
				require("cfg.nlspsettings")
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
	})

	-- Deoplete completion
	if completion == "deoplete" then
		use({
			"Shougo/deoplete.nvim",
			tag = "6.1",
			run = ":UpdateRemotePlugins",
			config = function()
				require("cfg.deoplete")
			end,
			requires = {
				{
					"Shougo/neosnippet",
					config = function()
						require("cfg.neosnippet")
					end,
				},
				-- deoplete code completion language support
				{ "zchee/deoplete-zsh", ft = "zsh" },
				{ "Shougo/neco-vim", ft = "vim" },
				{ "zchee/deoplete-jedi", ft = "python" },

				{
					"carlitux/deoplete-ternjs",
					run = "yarn global add tern",
					ft = { "javascript", "javascriptreact", "javascript.jsx" },
				},
				{ "wokalski/autocomplete-flow", ft = { "javascript", "javascriptreact", "javascript.jsx" } },

				{
					"zchee/deoplete-go",
					run = "make",
					ft = { "go", "gomod", "gowork", "gotmpl" },
				},
				{ "sebastianmarkow/deoplete-rust", ft = "rust" },

				{ "slashmili/alchemist.vim", ft = "elixir" },

				{
					"pbogut/deoplete-elm",
					run = "yarn global add elm-oracle",
					ft = "elm",
				},
				{ "reasonml-editor/vim-reason-plus", ft = "reason" },
				{ "kristijanhusak/deoplete-phpactor", ft = "php" },
				{
					"fatih/vim-go",
					run = ":GoInstallBinaries",
					ft = { "go", "gomod", "gowork", "gotmpl" },
					config = function()
						local go = require("cfg.languages.go")
						go.vim()
						go.deoplete()
					end,
				},
			},
		})
	end

	-- CMP completion
	if completion == "cmp" then
		use({
			"hrsh7th/nvim-cmp",
			requires = {
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
					requires = "dcampos/nvim-snippy",
					config = function()
						require("cfg.snippy")
					end,
				},

				-- neosnippet -- VimScript SnipMate support (inactive)
				--'notomo/cmp-neosnippet',
				--'Shougo/neosnippet-snippets',

				{
					"petertriho/cmp-git",
					requires = "nvim-lua/plenary.nvim",
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
						require("cfg.autopairs")
					end,
				},

				{ "reasonml-editor/vim-reason-plus", ft = "reason" },

				--[[
				{
					"fatih/vim-go",
					--disable = true,
					run = ":GoInstallBinaries",
					ft = { "go", "gomod", "gowork", "gotmpl" },
					config = function()
						require("cfg.languages.go").nvim_go() -- disable all the defaults from vim-go
					end,
				},
				--]]

				--#[[
				{
					"ray-x/go.nvim",
					ft = { "go", "gomod", "gowork", "gotmpl" },
					config = function()
						require("cfg.languages.go").nvim()
					end,
				},
				--]]

				{
					"kristijanhusak/vim-dadbod-completion",
					ft = { "sql", "mysol", "plsql" },
					config = function()
						require("cfg.languages.sql")
					end,
				},
				{
					"nvim-neotest/neotest",
					requires = {
						"nvim-neotest/neotest-go",
						-- Your other test adapters here
					},
					config = function()
						-- get neotest namespace (api call creates or returns namespace)
						local neotest_ns = vim.api.nvim_create_namespace("neotest")
						vim.diagnostic.config({
							virtual_text = {
								format = function(diagnostic)
									local message = diagnostic.message
										:gsub("\n", " ")
										:gsub("\t", " ")
										:gsub("%s+", " ")
										:gsub("^%s+", "")
									return message
								end,
							},
						}, neotest_ns)
						require("neotest").setup({
							-- your neotest config here
							adapters = {
								require("neotest-go"),
							},
						})
						vim.keymap.set("n", "<leader>ngt", require("neotest").run.run)
					end,
				},
			},
			config = function()
				require("cfg.cmp")
			end,
		})

		use({
			{
				"ray-x/navigator.lua", -- LSP code navigation
				requires = {
					"ray-x/guihua.lua", -- GUI utils, not completions
					run = "cd lua/fzy && make",
					config = function()
						require("guihua.maps").setup({})
					end,
				},
				config = function()
					require("cfg.navigator")
				end,
			},

			{
				"nvim-telescope/telescope.nvim",
				requires = {
					"nvim-lua/plenary.nvim",
				},
				config = function()
					require("cfg.telescope")
				end,
			},
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "make",
				cond = vim.fn.executable("make") == 1,
			},

			{
				"folke/trouble.nvim",
				requires = "kyazdani42/nvim-web-devicons",
			},

			{
				"jose-elias-alvarez/null-ls.nvim", -- inject LSP diagnostics, code acitons, etc
				requires = {
					"nvim-lua/plenary.nvim",
					"ThePrimeagen/refactoring.nvim",
				},
				config = function()
					require("cfg.null-ls")
				end,
			},
		})
	end

	-- editing improvements
	use({
		"christoomey/vim-sort-motion",
		{
			"terryma/vim-expand-region",
			config = function()
				require("cfg.expand-region")
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
			disable = true,
		},

		{
			"nvim-treesitter/nvim-treesitter",
			run = function()
				local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
				ts_update()
			end,
			config = function()
				require("cfg.treesitter").treesitter()
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			--disable = true,
			after = "nvim-treesitter",
			requires = "nvim-treesitter/nvim-treesitter",
			config = function()
				require("cfg.treesitter").textobjects()
			end,
		},
		-- UI addition
		{
			"vim-ctrlspace/vim-ctrlspace",
			config = function()
				require("cfg.ctrlspace")
			end,
		},
		{
			"majutsushi/tagbar",
			config = function()
				require("cfg.tagbar")
			end,
		},
		"scrooloose/nerdcommenter",
		{
			"scrooloose/nerdtree",
			disable = true,
			config = function()
				require("cfg.nerdtree")
			end,
		},
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
			},
			config = function()
				require("cfg.neotree")
			end,
		},
		{
			"severin-lemaignan/vim-minimap",
			config = function()
				require("cfg.minimap")
			end,
		},
		{
			"ibhagwan/fzf-lua",
			-- optional for icon support
			requires = {
				"kyazdani42/nvim-web-devicons",
				{ "junegunn/fzf", run = "./install --bin" },
			},
		},
	})

	-- status line replacement
	use({
		{
			"nvim-lualine/lualine.nvim",
			disable = false,
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = function()
				require("cfg.lualine")
			end,
		},

		{
			"windwp/windline.nvim",
			disable = true,
			requires = {
				"nvim-lua/plenary.nvim",
				{ "kyazdani42/nvim-web-devicons", opt = true },
			},
			config = function()
				require("cfg.windline")
			end,
		},
	})

	--#[[
	use({
		"folke/noice.nvim", -- experimental UI overhaul
		disable = true,
		--event = "VimEnter",
		config = function()
			require("noice").setup()
		end,
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			--"rcarriga/nvim-notify",
		},
	})
	--]]
	-- utilities
	use({
		"robertbasic/vim-hugo-helper",

		{
			"wthollingsworth/pomodoro.nvim",
			requires = {
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
			requires = {
				"nvim-treesitter/nvim-treesitter",
			},
			config = function()
				require("cfg.orgmode")
			end,
		},
	})

	-- git shit
	use({
		{
			"lewis6991/gitsigns.nvim",
			config = function()
				require("cfg.gitsigns")
			end,
		},
		{
			"tpope/vim-fugitive",
			config = function()
				require("cfg.fugitive")
			end,
		},
		"tpope/vim-git",
		{
			"pwntester/octo.nvim",
			config = function()
				require("cfg.octo")
			end,
		},
	})

	-- common languages
	use({
		{ "ollykel/v-vim", ft = "vlang" },
		{ "ziglang/zig.vim", ft = "zig" },
		{ "teal-language/vim-teal", ft = "teal" },
		{
			"leafo/moonscript-vim",
			ft = "moon",
			config = function()
				require("cfg.languages.moon")
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
			run = "go install github.com/jackc/sqlfmt/cmd/sqlfmt@latest",
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
			run = "cd app && yarn install",
			ft = { "md", "markdown" },
			config = function()
				require("cfg.markdown-preview")
			end,
		},
	})

	-- Web dev
	use({
		-- Typescript
		--{ "leafgarland/typescript-vim", ft = "typescript" },
		--{ "Quramy/tsuquyomi", ft = "typescript" },

		{ "pangloss/vim-javascript", ft = { "javascript", "javascriptreact", "javascript.jsx" } },
		{
			"MaxMEllon/vim-jsx-pretty",
			ft = { "javascript", "javascriptreact", "javascript.jsx" },
			requires = {
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
				require("cfg.languages.elm")
			end,
		},
		-- Reason
		--{'reasonml-editor/vim-reason-plus', ft = 'reason' },
		{ "jordwalke/vim-reasonml", ft = "reason" },
		{ "rescript-lang/vim-rescript", ft = "rescript" },

		{ "kchmck/vim-coffee-script", ft = "coffee" },
	})

	-- Mostly employment project languages
	use({
		{
			"hashivim/vim-terraform",
			ft = "terraform",
			config = function()
				require("cfg.languages.terraform")
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
				run = "composer install --no-dev -o",
				ft = "php",
			},
		},
		{ "aklt/plantuml-syntax", ft = "plantuml" },
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
