return {
	"jose-elias-alvarez/null-ls.nvim",
	opts = function(_, opts)
		if type(opts.sources) == "table" then
			local nls = require("null-ls")
			-- vim.list_extend(opts.sources, {
			-- 	nls.builtins.formatting.oimports, -- Go update imports
			-- })
			for index, value in ipairs(opts.sources) do
				if value == nls.builtins.formatting.goimports_reviser then
					table.remove(opts.sources, index)
				end
			end
		end
	end,
	{
		"ray-x/go.nvim",
		ft = { "go", "gomod", "gowork", "gotmpl" },
		config = function()
			require("go").setup({
				-- goimport = "gopls", -- if set to 'gopls' will use golsp format
				-- gofmt = "gofumpt", -- if set to gopls will use golsp format
				max_line_len = 120,
				tag_transform = false,
				test_dir = "",
				comment_placeholder = " 	",
				lsp_cfg = true, -- false: use your own lspconfig
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
				lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
				lsp_on_attach = true, -- use on_attach from go.nvim
				dap_debug = true,
			})

			-- run goimports on save & exiting insert mode
			-- On InsertLeave might be slightly annoying because, unlike on save, it
			-- doesn't preseve the cursor location
			vim.api.nvim_create_autocmd({ "InsertLeave" }, {
				pattern = "<buffer>",
				callback = function()
					require("go.format").goimport()
					require("go.format").org_imports(500)
					--require("go.format").gofmt()
				end,
			})

			-- vim-go keys ported to go.nvim
			vim.keymap.set("n", "<Leader>cb", ":GoBuild<cr>", { desc = "Go Build" })
			vim.keymap.set("n", "<Leader>cf", ":GoFmt<cr>", { desc = "Go Fmt" })
			vim.keymap.set("n", "<Leader>cl", ":GoLint<cr>", { desc = "Go Lint" })
			vim.keymap.set("n", "<Leader>ct", ":GoTest -p<cr>", { desc = "Go Test" })
			vim.keymap.set("n", "<Leader>ctf", ":GoTestFunc<cr>", { desc = "Func" })
			vim.keymap.set("n", "<Leader>ctc", ":GoCoverage<cr>", { desc = "Go Coverage" })
			vim.keymap.set("n", "<Leader>ctct", ":GoCoverage -t<cr>", { desc = "Go Coverage?" })
			vim.keymap.set("n", "<Leader>ctcc", ":GoCoverage -R<cr>", { desc = "Go Clear Coverage" })
			vim.keymap.set("n", "<Leader>cv", ":GoVet<cr>", { desc = "Go Vet" })
			vim.keymap.set("n", "<Leader>cd", ":GoDoc<cr>", { desc = "Go Doc" })
			vim.keymap.set("n", "<Leader>cr", ":GoRename<cr>", { desc = "Go Rename" })
			vim.keymap.set("n", "<Leader>cs", ":GoImpl<cr>", { desc = "Go Impl" })
			vim.keymap.set("n", "<Leader>cy", ":GoRun<cr>", { desc = "Go Run" })
			vim.keymap.set("n", "<Leader>ca", ":GoAlt<cr>", { desc = "To Test" })
		end,
	},
}
