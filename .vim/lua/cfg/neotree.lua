-- Map F7 to toggle Neotree
vim.keymap.set("n", "<F7>", ":Neotree toggle<CR>", { silent = true })
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
