local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Put these in an autocmd group, so that we can delete them easily.
augroup("vimrcEx", { clear = true })

-- For all text files set 'textwidth' to 78 characters.
autocmd("FileType", { group = "vimrcEx", pattern = { "text" }, command = "setlocal textwidth=78" })

-- spaces
autocmd("Filetype", {
	group = "vimrcEx",
	pattern = {
		"ada",
		"sh",
		"html",
		"ruby",
		"eruby",
		"markdown",
		"php",
		"javascript",
		"typescript",
		"coffee",
		"moon",
		"less",
		"scss",
		"wla.z80",
	},
	command = "setlocal ts=4 sts=4 sw=4 expandtab list lcs=tab:»»,trail:…",
})

-- 2 spaces
autocmd("Filetype", {
	group = "vimrcEx",
	pattern = {
		"yaml",
		"yml",
	},
	command = "setlocal ts=2 sts=2 sw=2 expandtab list lcs=tab:»»,trail:…",
})

-- PEP 8
autocmd("FileType", {
	group = "vimrcEx",
	pattern = { "py" },
	command = "setlocal ts=4 sts=4 sw=4 textwidth=79 expandtab autoindent fileformat=unix lcs=tab:»»,trail:…",
})

autocmd("Filetype", {
	group = "vimrcEx",
	pattern = { "go", "lua", "vim", "zsh", "jsonnet" },
	command = "setlocal noet ts=4 sts=4 sw=4 list lcs=tab:»-,trail:…",
})
