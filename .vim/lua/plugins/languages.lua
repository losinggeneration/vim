if vim.g.disable_extra_plugins == true then
	return {}
end

return {
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
	{ "kristijanhusak/vim-dadbod-ui", dependencies = { "tpope/vim-dadbod" } },
	{ "chrisbra/csv.vim", ft = "csv" },

	-- Python
	{
		{ "vim-scripts/indentpython.vim", ft = "python" },
		{ "nvie/vim-flake8", ft = "python" },
		{ "python-mode/python-mode", branch = "develop", ft = "python" },
	},

	-- Random just in case languages
	{ "elixir-lang/vim-elixir", ft = "elixir" },

	{ "fatih/vim-nginx", ft = "nginx" },
	{
		"elzr/vim-json",
		ft = "json",
		config = function(_, _)
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
		config = function(_, _)
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

	{
		"mattn/emmet-vim",
		ft = { "javascript", "javascriptreact", "javascript.jsx", "html", "css", "vue" },
	},

	-- Mostly employment project languages
	{
		"hashivim/vim-terraform",
		ft = "terraform",
		config = function()
			vim.g.terraform_align = 1
			vim.g.terraform_fmt_on_save = 1
		end,
	},
	{
		"google/vim-jsonnet",
		config = function()
			vim.g.jsonnet_fmt_on_save = 0
		end,
		ft = "jsonnet",
	},
	{ "aklt/plantuml-syntax", ft = "plantuml" },
}
