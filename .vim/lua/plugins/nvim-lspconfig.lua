local wrap = function(fn, ...)
	local arg = ...
	return function()
		fn(arg)
	end
end

return {
	"neovim/nvim-lspconfig",

	init = function()
		local keys = require("lazyvim.plugins.lsp.keymaps").get()
		-- Diagnostic keymaps
		keys[#keys + 1] = {
			"[d",
			function()
				if not vim.diagnostic.is_disabled(0) and vim.diagnostic.get_prev() ~= nil then
					vim.diagnostic.goto_prev()
				end
			end,
			desc = "LSP: previous issue",
		}

		keys[#keys + 1] = {
			"]d",
			function()
				if not vim.diagnostic.is_disabled(0) and vim.diagnostic.get_next() ~= nil then
					vim.diagnostic.goto_next()
				end
			end,
			"LSP: next issue",
		}

		keys[#keys + 1] = { "<leader>ce", vim.diagnostic.open_float, desc = "LSP: Diagnostic Float" }
		keys[#keys + 1] = { "<leader>cq", vim.diagnostic.setloclist, desc = "LSP: Diagnostic SetLoc" }
		keys[#keys + 1] = { "<leader>cn", vim.lsp.buf.rename, desc = "LSP: Re[n]ame" }
		keys[#keys + 1] = { "<Leader>cF", vim.lsp.buf.format, desc = "LSP: Re[F]ormat file" }
		keys[#keys + 1] = { "<leader>ca", vim.lsp.buf.code_action, desc = "LSP: [C]ode [A]ction" }
		keys[#keys + 1] = {
			"<leader>cy",
			require("telescope.builtin").lsp_document_symbols,
			desc = "LSP: Document S[y]mbols",
		}
		keys[#keys + 1] = {
			"<leader>cw",
			require("telescope.builtin").lsp_dynamic_workspace_symbols,
			desc = "LSP: [W]orkspace Symbols",
		}

		-- diagnostics menu
		keys[#keys + 1] = {
			"<leader>xf",
			wrap(require("telescope.builtin").diagnostics, { buffnr = 0 }),
			desc = "LSP: [F]ile Diagnostics",
		}
		keys[#keys + 1] = {
			"<leader>xe",
			function()
				require("telescope.builtin").diagnostics({ severity = "error" })
			end,
			desc = "LSP: [E]rror Diagnostics",
		}

		-- replace some keymaps to use telescope
		keys[#keys + 1] = { "gd", require("telescope.builtin").lsp_definitions, desc = "LSP: [G]oto [D]efinition" }
		keys[#keys + 1] = { "gD", vim.lsp.buf.declaration, desc = "LSP: [G]oto [D]eclaration" }
		keys[#keys + 1] = {
			"gr",
			wrap(require("telescope.builtin").lsp_references, { jump_type = "never" }),
			desc = "LSP: [G]oto [R]eferences",
		}
		keys[#keys + 1] = {
			"gi",
			wrap(require("telescope.builtin").lsp_implementations, { jump_type = "never" }),
			desc = "LSP: [G]oto [I]mplementation",
		}
		keys[#keys + 1] = {
			"td",
			wrap(require("telescope.builtin").lsp_type_definitions, { jump_type = "never" }),
			desc = "LSP: [T]ype [D]efinition",
		}

		-- See `:help K` for why this keymap
		-- nmap("K", vim.lsp.buf.hover, "Hover Documentation")
		keys[#keys + 1] = { "<C-k>", vim.lsp.buf.signature_help, desc = "LSP: Signature Documentation" }

		-- Lesser used LSP functionality
		keys[#keys + 1] = { "<leader>ba", vim.lsp.buf.add_workspace_folder, desc = "LSP: Workspace [A]dd Folder" }
		keys[#keys + 1] = { "<leader>br", vim.lsp.buf.remove_workspace_folder, desc = "LSP: Workspace [R]emove Folder" }
		keys[#keys + 1] = {
			"<leader>bl",
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			desc = "LSP: Workspace [L]ist Folders",
		}
		keys[#keys + 1] = { "<leader>ls", "<cmd>LspStart<CR>", desc = "LSP: [S]tart" }
		keys[#keys + 1] = { "<leader>lp", "<cmd>LspStop<CR>", desc = "LSP: Sto[p]" }
		keys[#keys + 1] = { "<leader>lr", "<cmd>LspRestart<CR>", desc = "LSP: [R]estart" }
	end,

	opts = {
		servers = {
			clangd = {},
			gopls = {
				settings = {
					gopls = {
						buildFlags = { "-tags", "integration" },
					},
				},
			},
			efm = {},
			jsonls = {},
			rust_analyzer = {},
			teal_ls = {},
			tsserver = {},
			zls = {},
			lua_ls = {
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = true,
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
						format = {
							enable = false,
						},
						completion = {
							callSnippet = "Replace",
							displayContext = 4,
						},
						telemetry = { enable = false },
					},
				},
			},
		},
	},

	-- config = function(_, opts)
	-- 	vim.print(opts)
	-- end,
}
