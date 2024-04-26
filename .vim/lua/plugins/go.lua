if vim.g.disable_extra_plugins == true then
	return {}
end

return {
	{
		"nvimtools/none-ls.nvim",

		opts = function(_, opts)
			-- increase the timeout a bit
			opts.format = opts.format or {
				timeout_ms = 1000,
			}

			if type(opts.sources) == "table" then
				local nls = require("null-ls")
				for index, value in ipairs(opts.sources) do
					-- remove this, it fucks up the import groupings
					if value == nls.builtins.formatting.goimports_reviser then
						table.remove(opts.sources, index)
					end
				end
			end

			return opts
		end,
	},
	{
		"ray-x/go.nvim",
		ft = { "go", "gomod", "gowork", "gotmpl" },
		lazy = true,
		dependencies = {
			"ray-x/guihua.lua", -- GUI utils, not completions
			build = "cd lua/fzy && make",
			config = function()
				require("guihua.maps").setup()
			end,
		},
		-- event = { "CmdlineEnter" },
		opts = {
			-- goimport = "gopls", -- if set to 'gopls' will use golsp format
			-- gofmt = "gofumpt", -- if set to gopls will use golsp format
			max_line_len = 120,
			tag_transform = false,
			test_dir = "",
			comment_placeholder = " 	",
			trouble = true,
			luasnip = true,
			lsp_keymaps = false,
			lsp_document_formatting = false,
			lsp_cfg = false, -- false: use your own lspconfig
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
			-- lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
			-- lsp_on_attach = true, -- use on_attach from go.nvim
			dap_debug = false,
		},
		config = function(_, opts)
			require("go").setup(opts)
			local nmap = function(keys)
				for _, k in ipairs(keys) do
					k.desc = k.desc or k[3]
					if k.desc then
						k.desc = "Go: " .. k.desc
					end

					local key, func = k[1], k[2]

					vim.keymap.set("n", key, func, { desc = k.desc })
				end
			end

			-- vim-go keys ported to go.nvim
			nmap({
				{ "<Leader>cgb", ":GoBuild<cr>", desc = "Build" },
				{ "<Leader>cgo", ":GoPkgOutline<cr>", desc = "Outline" },
				{ "<Leader>cgf", ":GoFmt<cr>", desc = "Fmt" },
				{ "<Leader>cgl", ":GoLint<cr>", desc = "Lint" },
				{ "<Leader>cgtt", ":GoTest -p<cr>", desc = "Test" },
				{ "<Leader>cgtf", ":GoTestFunc<cr>", desc = "Func" },
				{ "<Leader>cgtcc", ":GoCoverage<cr>", desc = "Coverage" },
				{ "<Leader>cgtct", ":GoCoverage -t<cr>", desc = "Coverage?" },
				{ "<Leader>cgtcr", ":GoCoverage -R<cr>", desc = "Remove Coverage" },
				{ "<Leader>cgv", ":GoVet<cr>", desc = "Vet" },
				{ "<Leader>cgd", ":GoDoc<cr>", desc = "Doc" },
				{ "<Leader>cgr", ":GoRename<cr>", desc = "Rename" },
				{ "<Leader>cgs", ":GoImpl<cr>", desc = "Impl" },
				{ "<Leader>cgy", ":GoRun<cr>", desc = "Run" },
				{ "<Leader>cgta", ":GoAlt<cr>", desc = "To Test" },
			})

			-- run goimports on save & exiting insert mode
			-- On InsertLeave might be slightly annoying because, unlike on save, it
			-- doesn't preseve the cursor location
			-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			-- 	pattern = "<buffer>",
			-- 	callback = function()
			-- 		-- require("go.format").goimport()
			-- 		require("go.format").org_imports()
			-- 		--require("go.format").gofmt()
			-- 	end,
			-- })
		end,
	},
}
