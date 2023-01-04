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

vim.g.completion = "cmp" -- one of ['deoplete', 'cmp'] or unset

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
		"morhetz/gruvbox",
		"sainnhe/gruvbox-material",
		"tomasr/molokai",
		"veloce/vim-aldmeris",
		"bluz71/vim-moonfly-colors",
		"bluz71/vim-nightfly-guicolors",
	})

	-- coding improvments
	use({
		"ciaranm/securemodelines",
		{
			"Shougo/echodoc.vim",
			run = "make",
			config = function()
				require("cfg.echodoc")
			end,
		},
		"vim-autoformat/vim-autoformat",
		--"is0n/fm-nvim", -- fuzzy finders
	})

	-- snippets used by the snippet plugins
	use({
		"Shougo/neosnippet-snippets",
		"honza/vim-snippets",
	})

	-- completion
	if vim.g.completion == "deoplete" then
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
				{
					"neovim/nvim-lspconfig",
					config = function()
						require("cfg.lspconfig")
					end,
				},
				{ "zchee/deoplete-zsh", ft = "zsh" },
				{ "Shougo/neco-vim", ft = "vim" },
				{ "zchee/deoplete-jedi", ft = "python" },

				{ "carlitux/deoplete-ternjs", run = "yarn global add tern", ft = { "javascript", "javascript.jsx" } },
				{ "wokalski/autocomplete-flow", ft = { "javascript", "javascript.jsx" } },

				{ "zchee/deoplete-go", run = "make", ft = "go" },
				{ "sebastianmarkow/deoplete-rust", ft = "rust" },

				{ "slashmili/alchemist.vim", ft = "elixir" },

				{ "pbogut/deoplete-elm", run = "yarn global add elm-oracle", ft = "elm" },
				{ "reasonml-editor/vim-reason-plus", ft = "reason" },

				{ "kristijanhusak/deoplete-phpactor", ft = "php" },
				{
					"fatih/vim-go",
					run = ":GoInstallBinaries",
					ft = "go",
					config = function()
						require("cfg.languages.go").vim()
					end,
				},
			},
		})
	elseif vim.g.completion == "cmp" then
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-nvim-lsp", -- LSP integration
				"hrsh7th/cmp-buffer", -- open buffer suggestions
				"hrsh7th/cmp-path", -- filesystem paths
				"hrsh7th/cmp-cmdline", -- command line suggestions
				"hrsh7th/cmp-omni", -- Vim's omnifunc
				{
					"neovim/nvim-lspconfig",
					config = function()
						require("cfg.lspconfig")
					end,
				}, -- nvim's LSP server specific configuration

				-- vsnip
				--'hrsh7th/cmp-vsnip',
				--'hrsh7th/vim-vsnip',

				-- luasnip
				--'saadparwaiz1/cmp_luasnip',
				--'L3MON4D3/LuaSnip',

				-- ultasnips
				--'quangnguyen30192/cmp-nvim-ultisnips'
				--'SirVer/ultisnips',

				-- snippy
				"dcampos/cmp-snippy",
				{
					"dcampos/nvim-snippy",
					config = function()
						require("cfg.snippy")
					end,
				},

				-- neosnippet
				--'notomo/cmp-neosnippet',
				--'Shougo/neosnippet-snippets',

				{
					"petertriho/cmp-git",
					requires = "nvim-lua/plenary.nvim",
					config = function()
						require("cmp_git").setup()
					end,
				},

				{ "hrsh7th/cmp-nvim-lua", ft = { "lua", "vim" } }, -- Nvim API completions
				--'f3fora/cmp-spell', -- spelling suggestions
				{
					"windwp/nvim-autopairs",
					config = function()
						require("cfg.autopairs")
					end,
				},
				{
					"nvim-treesitter/nvim-treesitter",
					run = ":TSUpdate",
					config = function()
						require("cfg.treesitter")
					end,
				},
				{ "reasonml-editor/vim-reason-plus", ft = "reason" },
				--#[[
				{
					"fatih/vim-go",
					run = ":GoInstallBinaries",
					ft = "go",
					config = function()
						require("cfg.languages.go").vim()
					end,
				},
				--]]
				--#[[
				{
					"ray-x/go.nvim",
					ft = "go",
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
			},
			config = function()
				require("cfg.cmp")
			end,
		})

		use({
			"ray-x/navigator.lua", -- LSP code navigation
			requires = {
				"ray-x/guihua.lua", -- GUI utils, not completions
				run = "cd lua/fzy && make",
			},
			config = function()
				require("cfg.navigator")
			end,
		})

		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
			},
		})

		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
		})

		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
			},
			config = function()
				require("cfg.null-ls")
			end,
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
		"tpope/vim-abolish",
		"tpope/vim-repeat",
		"tpope/vim-sensible",
		{
			"tpope/vim-sleuth",
			-- This can cause some issues with file types not respecting the
			-- desired global indentation. This also is what causes the
			-- initial text when nvim is open to go away without input.
			-- Because this also messes with the filetype, it can also
			-- cause color scheme colors to not load correctly.
			disable = true,
		},
		"tpope/vim-surround",
		--"xolox/vim-misc",
		"AndrewRadev/sideways.vim",
		"ackyshake/VimCompletesMe",
		"Yggdroot/indentLine",
		"pedrohdz/vim-yaml-folds",
		"tpope/vim-endwise",
	})

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		ft = { "md", "markdown" },
	})

	-- UI additions
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
			requires = {
				"kyazdani42/nvim-web-devicons",
				{ "junegunn/fzf", run = "./install --bin" },
			},
		}),
	})

	use({
		"nvim-lualine/lualine.nvim",
		disable = false,
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("cfg.lualine")
		end,
	})
	use({
		"windwp/windline.nvim",
		disable = true,
		requires = {
			"nvim-lua/plenary.nvim",
			{ "kyazdani42/nvim-web-devicons", opt = true },
		},
		config = function()
			require("cfg.windline")
		end,
	})

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
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope.nvim",
				"kyazdani42/nvim-web-devicons",
			},
			config = function()
				require("cfg.octo")
			end,
		},
	})

	-- common languages
	use({
		{ "ziglang/zig.vim", ft = "zig" },
		{ "luishdez/vim-less", ft = "less" },
		{
			"leafo/moonscript-vim",
			ft = "moon",
			config = function()
				require("cfg.languages.moon")
			end,
		},
		{ "elzr/vim-json", ft = "json" },
		{ "mxw/vim-jsx", ft = { "javascript", "javascript.jsx" } },
		{ "pangloss/vim-javascript", ft = { "javascript", "javascript.jsx" } },
		{ "cespare/vim-toml", ft = "toml" },
		{ "maralla/vim-toml-enhance", ft = "toml" },
		{ "mattn/vim-sqlfmt", ft = { "sql", "mysql" }, run = "go get -u github.com/jackc/sqlfmt/cmd/sqlfmt" },
		{ "teal-language/vim-teal", ft = "teal" },
		{
			"iamcco/markdown-preview.nvim",
			run = "cd app && yarn install",
			ft = { "md", "markdown" },
			config = function()
				require("cfg.markdown-preview")
			end,
		},
	})

	-- Typescript
	use({
		{ "leafgarland/typescript-vim", ft = "typescript" },
		{ "Quramy/tsuquyomi", ft = "typescript" },
	})

	-- Vue
	use({ "leafOfTree/vim-vue-plugin", ft = "vue" })
	use({"mattn/emmet-vim", ft = { "javascript", "javascript.jsx", "html", "css", "vue" }})

	-- Python
	use({
		{ "vim-scripts/indentpython.vim", ft = "python" },
		{ "nvie/vim-flake8", ft = "python" },
		{ "python-mode/python-mode", branch = "develop", ft = "python" },
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
	})
	use({ "cappyzawa/starlark.vim", ft = "starlark" })

	-- Mostly personal project languages
	use({ "jdonaldson/vaxe", ft = "haxe" })
	use({ "leafo/moonscript-vim", ft = "moon" })
	use({ "rust-lang/rust.vim", ft = "rust" })
	use(
		{
			"ElmCast/elm-vim",
			ft = "elm",
			config = function()
				require("cfg.languages.elm")
			end,
		},
	)
	use({ "jansenm/vim-cmake", ft = "cmake" })
	use({ "elixir-lang/vim-elixir", ft = "elixir" })

	-- Reason
	--use {'reasonml-editor/vim-reason-plus', ft = 'reason' }
	use({ "jordwalke/vim-reasonml", ft = "reason" })
	use({ "rescript-lang/vim-rescript", ft = "rescript" })

	-- Random just in case languages
	use({
		"google/vim-jsonnet",
		config = function()
			vim.g.jsonnet_fmt_on_save = 0
		end,
		ft = "jsonnet",
	})

	-- PHP
	use({
		{ "StanAngeloff/php.vim", ft = "php" },
		{ "vim-php/tagbar-phpctags.vim", ft = "php" },
		{
			"phpactor/phpactor",
			tag = "0.18.1",
			run = "composer install --no-dev -o",
			ft = "php",
		},
	})

	-- Ruby
	use({
		{ "tpope/vim-bundler", ft = "ruby" },
		{ "tpope/vim-rails", ft = "ruby" },
		{ "vim-ruby/vim-ruby", ft = "ruby" },
	})

	use({ "fatih/vim-nginx", ft = "nginx" })
	use({ "rhysd/vim-crystal", ft = "crystal" })
	use({ "derekwyatt/vim-scala", ft = "scala" })
	use({ "kchmck/vim-coffee-script", ft = "coffee" })
	use({ "peterhoeg/vim-qml", ft = "qml" })
	use({ "aklt/plantuml-syntax", ft = "plantuml" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
