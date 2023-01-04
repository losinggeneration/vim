vim.g["neosnippet#enable_completed_snippet"] = 1

-- Plugin key-mappings.
-- Note: It must be "imap" and "smap".  It uses <Plug> mappings.
vim.keymap.set({"i", "s"}, "<C-k>", "<Plug>(neosnippet_expand_or_jump)")
vim.keymap.set("x", "<C-k>", "<Plug>(neosnippet_expand_target)")

-- SuperTab like snippets behavior.
vim.keymap.set("s", "<expr><TAB>", function()
	return vim.cmd["neosnippet#expandable_or_jumpable"]() and "<Plug>(neosnippet_expand_or_jump)" or "<TAB>"
end)

-- For conceal markers.
if vim.conceal then
	vim.o.conceallevel = 2
	vim.o.concealcursor = "niv"
end
