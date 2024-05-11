require("mason").setup()

local mason_lspconfig = require("mason-lspconfig")

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

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

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
	--print("on_attach")
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	vim.b.autoformat = true

	-- Diagnostic keymaps
	nmap("[d", function()
		if not vim.diagnostic.is_disabled(0) and vim.diagnostic.get_prev() ~= nil then
			vim.diagnostic.goto_prev()
		end
	end)
	nmap("]d", function()
		if not vim.diagnostic.is_disabled(0) and vim.diagnostic.get_next() ~= nil then
			vim.diagnostic.goto_next()
		end
	end)

	nmap("<leader>e", vim.diagnostic.open_float)
	nmap("<leader>q", vim.diagnostic.setloclist)
	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<Leader>rf", vim.lsp.buf.format, "[R]e[f]ormat file")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
	nmap("gr", wrap(require("telescope.builtin").lsp_references, { jump_type = "never" }), "[G]oto [R]eferences")
	nmap(
		"gi",
		wrap(require("telescope.builtin").lsp_implementations, { jump_type = "never" }),
		"[G]oto [I]mplementation"
	)
	nmap("td", wrap(require("telescope.builtin").lsp_type_definitions, { jump_type = "never" }), "[T]ype [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
	nmap("<leader>fd", wrap(require("telescope.builtin").diagnostics, { buffnr = 0 }), "[F]ile [D]iagnostics")
	nmap("<leader>ed", function()
		require("telescope.builtin").diagnostics({ severity = "error" })
	end, "[E]rror [D]iagnostics")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

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

if completion == "cmp" then
	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
end

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
