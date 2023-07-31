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
		"neovim/nvim-lspconfig", -- Automatically install LSPs to stdpath for neovim
		"williamboman/mason.nvim",

		{
			"williamboman/mason-lspconfig.nvim",
			config = function()
				require("cfg.mason-lspconfig")
			end,
			dependencies = {
				{
					"tamago324/nlsp-settings.nvim",
					--enabled = false,
					config = function()
						require("cfg.nlspsettings")
					end,
				},
				{
					"folke/neoconf.nvim",
					enabled = false,
					config = function()
						require("cfg.neoconf")
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
				require("cfg.treesitter").treesitter()
			end,
			dependencies = {
				{
					--"nvim-treesitter/nvim-treesitter-textobjects",
					"theHamsta/nvim-treesitter-textobjects",
					branch = "fix-go",
					--enabled = false,
					config = function()
						require("cfg.treesitter").textobjects()
					end,
				},
			},
		},
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
			require("cfg.nerdtree")
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
			dependencies = {
				"nvim-treesitter/nvim-treesitter",
			},
			config = function()
				require("cfg.orgmode")
			end,
		},
	},

	-- git shit
	{
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
				require("cfg.markdown-preview")
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
				require("cfg.languages.elm")
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
