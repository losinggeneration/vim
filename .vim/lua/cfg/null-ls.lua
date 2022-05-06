local null_ls = require("null-ls")
null_ls.setup({
	debug = true,
	sources = {
		null_ls.builtins.code_actions.refactoring,
		null_ls.builtins.code_actions.shellcheck,
		--null_ls.builtins.code_actions.gitsigns, -- Git actions at position
		null_ls.builtins.code_actions.eslint,

		null_ls.builtins.completion.luasnip, -- luasnip completion
		null_ls.builtins.completion.tags, -- completion for tags
		null_ls.builtins.completion.spell, -- completion for spelling

		--null_ls.builtins.diagnostics.cspell, -- code spell checker
		null_ls.builtins.diagnostics.gitlint, -- Git commit messages linter
		null_ls.builtins.diagnostics.golangci_lint, -- Go Lint
		null_ls.builtins.diagnostics.hadolint, -- Dockerfile best practices
		null_ls.builtins.diagnostics.jsonlint, -- JSON lint
		--null_ls.builtins.diagnostics.luacheck, -- Lua linter
		--null_ls.builtins.diagnostics.revive, -- Go linter
		--null_ls.builtins.diagnostics.selene, -- Lua linter
		null_ls.builtins.diagnostics.staticcheck, -- Go linter
		null_ls.builtins.diagnostics.teal, -- Teal linter
		null_ls.builtins.diagnostics.tsc, -- Typescript check with the compiler
		null_ls.builtins.diagnostics.zsh,
		null_ls.builtins.diagnostics.eslint, -- Typescript check with eslint

		null_ls.builtins.formatting.asmfmt,
		null_ls.builtins.formatting.cljstyle, -- Clojure fmt
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.cmake_format,
		null_ls.builtins.formatting.dfmt, -- D fmt
		null_ls.builtins.formatting.elm_format,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.jq,
		null_ls.builtins.formatting.lua_format,
		null_ls.builtins.formatting.prettier, -- Typescript with prettier
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.trim_whitespace, -- Remove junk whitespace
		null_ls.builtins.formatting.zigfmt,
	},
})
