if vim.g.disable_extra_plugins == true then
	return {}
end

return {
	{ "folke/lazydev.nvim", ft = "lua" },
	{ "ollykel/v-vim", ft = "vlang" },
	{ "ziglang/zig.vim", ft = "zig" },
	{ "teal-language/vim-teal", ft = "teal" },
	{
		"leafo/moonscript-vim",
		ft = "moon",
		config = function()
			local nmap = function(keys)
				for _, k in ipairs(keys) do
					if k.desc then
						k.desc = "Moon: " .. k.desc
					end

					local key, func = k[1], k[2]

					vim.keymap.set("n", key, func, { desc = k.desc })
				end
			end

			nmap({
				{ "<Leader>mc", [[:!moonc "%:p"<cr>]], desc = "compile" },
				{ "<Leader>mb", [[:!moonc "%:p:h"<cr>]], desc = "build" },
				{ "<Leader>ml", [[:!moonc -l "%:p"<cr>]], desc = "lint" },
			})
		end,
	},

	-- Mostly personal project languages
	{ "rust-lang/rust.vim", ft = "rust" },
	{ "jdonaldson/vaxe", ft = "haxe" },
	{ "jansenm/vim-cmake", ft = "cmake" },
	{ "peterhoeg/vim-qml", ft = "qml" },
	{ "samsaga2/vim-z80" },
	{ "NewLunarFire/wla-vim" },

	-- SQL
	{
		"mattn/vim-sqlfmt",
		ft = { "sql", "mysql" },
		build = "go install github.com/jackc/sqlfmt/cmd/sqlfmt@latest",
	},
	{ "kristijanhusak/vim-dadbod-ui" },
	{ "tpope/vim-dadbod" },
	{ "chrisbra/csv.vim", ft = "csv" },

	-- { "mfussenegger/nvim-dap", config = function() end }, -- Debug adapter protocol
	-- required for nvim-dap-ui but not included elsewhere for some reason
	"nvim-neotest/nvim-nio",

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
	{
		"elzr/vim-json",
		ft = "json",
		config = function(_, opts)
			-- reformat json files with jq
			vim.keymap.set("n", "<Leader>jq", "GVgg :!jq .<cr>", { desc = "reformat json" })
		end,
	},
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
		config = function(_, opts)
			local nmap = function(keys)
				for _, k in ipairs(keys) do
					if k.desc then
						k.desc = "Markdown: " .. k.desc
					end

					local key, func = k[1], k[2]

					vim.keymap.set("n", key, func, { desc = k.desc })
				end
			end

			nmap({
				{ "<leader>mp", "<Plug>MarkdownPreview", desc = "preview" },
				{ "<leader>ms", "<Plug>MarkdownPreviewStop", desc = "stop" },
				{ "<leader>mt", "<Plug>MarkdownPreviewToggle", desc = "toggle" },
			})
		end,
	},

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
		config = function(_, opts)
			local nmap = function(keys)
				for _, k in ipairs(keys) do
					if k.desc then
						k.desc = "Go: " .. k.desc
					end

					local key, func = k[1], k[2]

					vim.keymap.set("n", key, func, { desc = k.desc })
				end
			end

			nmap({
				{ "<leader>cel", ":ElmEvalLine<CR>" },
				{ mode = "v", "<leader>ces", ":<C-u>ElmEvalSelection<CR>" },
				{ "<leader>cem", ":ElmMakeCurrentFile<CR>" },
			})
		end,
	},
	-- Reason
	{ "reasonml-editor/vim-reason-plus", ft = "reason" },
	{ "rescript-lang/vim-rescript", ft = "rescript" },

	{ "kchmck/vim-coffee-script", ft = "coffee" },

	-- Mostly employment project languages
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
}
