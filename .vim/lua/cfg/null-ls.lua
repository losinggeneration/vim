local null_ls = require("null-ls")

null_ls.setup({
	debug = false,
	sources = {
		-- Code Actions
		null_ls.builtins.code_actions.eslint,
		--null_ls.builtins.code_actions.gitsigns, -- Git actions at position
		null_ls.builtins.code_actions.gomodifytags,
		null_ls.builtins.code_actions.refactoring,
		null_ls.builtins.code_actions.shellcheck,

		-- Completion
		null_ls.builtins.completion.luasnip, -- luasnip completion
		--null_ls.builtins.completion.vsnip, -- vsnip completion
		--null_ls.builtins.completion.spell, -- completion for spelling
		null_ls.builtins.completion.tags, -- completion for tags

		-- Linters
		--null_ls.builtins.diagnostics.cspell, -- code spell checker
		null_ls.builtins.diagnostics.eslint, -- Typescript check with eslint
		null_ls.builtins.diagnostics.gitlint, -- Git commit messages linter
		null_ls.builtins.diagnostics.golangci_lint.with({
			args = function(params)
				return {
					"run",
					params.bufname,
					"--fix=false",
					"--enable-all",
					"--fast",
					"--out-format=json",
					"--path-prefix",
					"$ROOT",
					"--max-issues-per-linter",
					"0",
				}
			end,
		}), -- Go Lint
		null_ls.builtins.diagnostics.hadolint, -- Dockerfile best practices
		null_ls.builtins.diagnostics.jsonlint, -- JSON lint
		--null_ls.builtins.diagnostics.luacheck, -- Lua linter
		--null_ls.builtins.diagnostics.revive, -- Go linter
		--null_ls.builtins.diagnostics.selene, -- Lua linter
		null_ls.builtins.diagnostics.staticcheck, -- Go linter
		null_ls.builtins.diagnostics.teal, -- Teal linter
		null_ls.builtins.diagnostics.tsc, -- Typescript check with the compiler
		null_ls.builtins.diagnostics.yamllint,
		null_ls.builtins.diagnostics.zsh,

		-- Formatters
		null_ls.builtins.formatting.asmfmt,
		null_ls.builtins.formatting.cljstyle, -- Clojure fmt
		null_ls.builtins.formatting.cmake_format,
		null_ls.builtins.formatting.dfmt, -- D fmt
		null_ls.builtins.formatting.elm_format,
		null_ls.builtins.formatting.goimports, -- Go update imports
		null_ls.builtins.formatting.gofumpt, -- Go fmt
		null_ls.builtins.formatting.jq,
		null_ls.builtins.formatting.prettier, -- Typescript with prettier
		null_ls.builtins.formatting.prettierd, -- yaml with prettier
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.trim_whitespace, -- Remove junk whitespace
		null_ls.builtins.formatting.zigfmt,
	},
})
