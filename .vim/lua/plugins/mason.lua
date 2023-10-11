-- Ensure the servers are installed
local servers = {
	clangd = {},
	gopls = {
		gopls = {
			buildFlags = { "-tags", "integration" },
		},
	},
	jsonls = {},
	rust_analyzer = {},
	teal_ls = {},
	tsserver = {},
	zls = {},
	lua_ls = {
		Lua = {
			workspace = {
				checkThirdParty = true,
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
			completion = {
				enable = true,
				displayContext = true,
				showParams = true,
			},
			telemetry = { enable = false },
		},
	},
}

return {
	"williamboman/mason-lspconfig.nvim",

	opts = {
		ensure_installed = vim.tbl_keys(servers),
	},

	config = function(_, opts)
		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup(vim.tbl_extend("force", opts, {
			ensure_installed = vim.tbl_keys(servers),
		}))

		servers.yamlls = {
			yaml = {
				maxItemsComputed = 5000 * 10,
			},
		}

		local wrap = function(fn, ...)
			local arg = ...
			return function()
				fn(arg)
			end
		end

		-- LSP settings.
		--  This function gets run when an LSP connects to a particular buffer.
		local on_attach = function(_, bufnr)
			local nmap = function(keys)
				for _, k in ipairs(keys) do
					k.desc = k.desc or k[3]
					if k.desc then
						k.desc = "LSP: " .. k.desc
					end

					local key, func = k[1], k[2]

					vim.keymap.set("n", key, func, { buffer = bufnr, desc = k.desc })
				end
			end

			vim.b.autoformat = true

			nmap({
				-- Diagnostic keymaps
				{
					"[d",
					function()
						if not vim.diagnostic.is_disabled(0) and vim.diagnostic.get_prev() ~= nil then
							vim.diagnostic.goto_prev()
						end
					end,
					"previous issue",
				},
				{
					"]d",
					function()
						if not vim.diagnostic.is_disabled(0) and vim.diagnostic.get_next() ~= nil then
							vim.diagnostic.goto_next()
						end
					end,
					"next issue",
				},

				{ "<leader>ce", vim.diagnostic.open_float, "Diagnostic Float" },
				{ "<leader>cq", vim.diagnostic.setloclist, "Diagnostic SetLoc" },
				{ "<leader>crn", vim.lsp.buf.rename, "[R]e[n]ame" },
				{ "<Leader>crf", vim.lsp.buf.format, "[R]e[f]ormat file" },
				{ "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction" },

				{ "gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition" },
				{
					"gr",
					wrap(require("telescope.builtin").lsp_references, { jump_type = "never" }),
					"[G]oto [R]eferences",
				},
				{
					"gi",
					wrap(require("telescope.builtin").lsp_implementations, { jump_type = "never" }),
					"[G]oto [I]mplementation",
				},
				{
					"td",
					wrap(require("telescope.builtin").lsp_type_definitions, { jump_type = "never" }),
					"[T]ype [D]efinition",
				},
				{ "<leader>cy", require("telescope.builtin").lsp_document_symbols, "Document S[y]mbols" },
				{ "<leader>cw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace Symbols" },
				{ "<leader>xf", wrap(require("telescope.builtin").diagnostics, { buffnr = 0 }), "[F]ile Diagnostics" },
				{
					"<leader>xe",
					function()
						require("telescope.builtin").diagnostics({ severity = "error" })
					end,
					"[E]rror Diagnostics",
				},

				-- See `:help K` for why this keymap
				-- nmap("K", vim.lsp.buf.hover, "Hover Documentation")
				{ "<C-k>", vim.lsp.buf.signature_help, "Signature Documentation" },

				-- Lesser used LSP functionality
				{ "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration" },
				{ "<leader>lwa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder" },
				{ "<leader>lwr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder" },
				{
					"<leader>lwl",
					function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end,
					"[W]orkspace [L]ist Folders",
				},
				{ "<leader>ls", "<cmd>LspStart<CR>", "[S]tart" },
				{ "<leader>lp", "<cmd>LspStop<CR>", "Sto[p]" },
				{ "<leader>lr", "<cmd>LspRestart<CR>", "[R]estart" },
			})

			-- Create a command `:Format` local to the LSP buffer
			vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
				vim.lsp.buf.format()
			end, { desc = "Format current buffer with LSP" })

			-- format on save
			vim.api.nvim_create_autocmd({
				"BufWritePre",
				--[[ "InsertLeave", --]]
			}, {
				pattern = "<buffer>",
				callback = function()
					if vim.b.autoformat then
						vim.lsp.buf.format()
					end
				end,
			})
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

		-- automatic setup for installed servers
		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server_name],
				})
			end,
		})
	end,
}
