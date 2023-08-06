return {
	{ "ollykel/v-vim", ft = "vlang" },
	{ "ziglang/zig.vim", ft = "zig" },
	{ "teal-language/vim-teal", ft = "teal" },
	{
		"leafo/moonscript-vim",
		ft = "moon",
		keys = {
			{ "<Leader>mc", [[:!moonc "%:p"<cr>]] },
			{ "<Leader>mb", [[:!moonc "%:p:h"<cr>]] },
			{ "<Leader>ml", [[:!moonc -l "%:p"<cr>]] },
		},
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

	-- { "mfussenegger/nvim-dap" }, -- Debug adapter protocol

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
		keys = {
			{ "<C-s>", "<Plug>MarkdownPreview" },
			{ "<M-s>", "<Plug>MarkdownPreviewStop" },
			{ "<C-p>", "<Plug>MarkdownPreviewToggle" },
		},
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
		keys = {
			{ "<leader>el", ":ElmEvalLine<CR>" },
			{ mode = "v", "<leader>es", ":<C-u>ElmEvalSelection<CR>" },
			{ "<leader>em", ":ElmMakeCurrentFile<CR>" },
		},
	},
	-- Reason
	-- { "reasonml-editor/vim-reason-plus", ft = "reason" },
	-- {'reasonml-editor/vim-reason-plus', ft = 'reason' },
	{ "jordwalke/vim-reasonml", ft = "reason" },
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
