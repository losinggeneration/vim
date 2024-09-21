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
	{ "jdonaldson/vaxe", ft = "haxe" },
	{ "peterhoeg/vim-qml", ft = "qml" },

	{ "samsaga2/vim-z80" },
	{ "NewLunarFire/wla-vim" },

	-- Mostly employment project languages
	{ "chrisbra/csv.vim", ft = "csv" },
	{ "fatih/vim-nginx", ft = "nginx" },
	{
		"mattn/emmet-vim",
		ft = { "javascript", "javascriptreact", "javascript.jsx", "html", "css", "vue" },
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
