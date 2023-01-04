-- Moonscript tools bindings
vim.keymap.set("n", "<Leader>c", [[:!moonc "%:p"<cr>]])
vim.keymap.set("n", "<Leader>b", [[:!moonc "%:p:h"<cr>]])
vim.keymap.set("n", "<Leader>l", [[:!moonc -l "%:p"<cr>]])
