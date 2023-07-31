local completion = "cmp" -- one of ['deoplete', 'cmp'] or unset

-- Deoplete completion
if completion == "deoplete" then
	return {
		"Shougo/deoplete.nvim",
		tag = "6.1",
		build = ":UpdateRemotePlugins",
		config = function()
			require("cfg.deoplete")
		end,
		dependencies = {
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
					local go = require("cfg.languages.go")
					go.vim()
					go.deoplete()
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
						require("cfg.snippy")
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
						require("cfg.autopairs")
					end,
				},

				{ "reasonml-editor/vim-reason-plus", ft = "reason" },

				--[[
	{
	"fatih/vim-go",
	--enabled = false,
	build = ":GoInstallBinaries",
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
			},
			config = function()
				require("cfg.cmp")
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
				require("cfg.navigator")
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
				require("cfg.null-ls")
			end,
		},
	}
end
