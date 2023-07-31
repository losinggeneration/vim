vim.keymap.set("n", "<Leader>Gd", ":Gdiff<cr>")
vim.keymap.set("n", "<Leader>Gc", ":Git commit<cr>")
vim.keymap.set("n", "<Leader>Gcv", ":Git commit -v<cr>")

return {
	"tpope/vim-fugitive",
	cmd = { "G", "Git", "Gdiff" },
}
