return {
	{
		"jose-elias-alvarez/null-ls.nvim",

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
		event = { "CmdlineEnter" },
		opts = {
			-- goimport = "gopls", -- if set to 'gopls' will use golsp format
			-- gofmt = "gofumpt", -- if set to gopls will use golsp format
			max_line_len = 120,
			tag_transform = false,
			test_dir = "",
			comment_placeholder = " 	",
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
			dap_debug = true,
		},
		config = function(_, opts)
			require("go").setup(opts)

			-- run goimports on save & exiting insert mode
			-- On InsertLeave might be slightly annoying because, unlike on save, it
			-- doesn't preseve the cursor location
			vim.api.nvim_create_autocmd({ "BufWritePre" }, {
				pattern = "<buffer>",
				callback = function()
					-- require("go.format").goimport()
					require("go.format").org_imports()
					--require("go.format").gofmt()
				end,
			})
		end,
		keys = {
			-- vim-go keys ported to go.nvim
			{ "<Leader>cb", ":GoBuild<cr>", desc = "Go Build" },
			{ "<Leader>cf", ":GoFmt<cr>", desc = "Go Fmt" },
			{ "<Leader>cl", ":GoLint<cr>", desc = "Go Lint" },
			{ "<Leader>ct", ":GoTest -p<cr>", desc = "Go Test" },
			{ "<Leader>ctf", ":GoTestFunc<cr>", desc = "Func" },
			{ "<Leader>ctc", ":GoCoverage<cr>", desc = "Go Coverage" },
			{ "<Leader>ctct", ":GoCoverage -t<cr>", desc = "Go Coverage?" },
			{ "<Leader>ctcc", ":GoCoverage -R<cr>", desc = "Go Clear Coverage" },
			{ "<Leader>cv", ":GoVet<cr>", desc = "Go Vet" },
			{ "<Leader>cd", ":GoDoc<cr>", desc = "Go Doc" },
			{ "<Leader>cr", ":GoRename<cr>", desc = "Go Rename" },
			{ "<Leader>cs", ":GoImpl<cr>", desc = "Go Impl" },
			{ "<Leader>cy", ":GoRun<cr>", desc = "Go Run" },
			{ "<Leader>cta", ":GoAlt<cr>", desc = "To Test" },
		},
	},
}
