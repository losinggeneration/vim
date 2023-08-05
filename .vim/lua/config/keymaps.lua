-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
	"n",
	"<leader>sx",
	require("telescope.builtin").resume,
	{ noremap = true, silent = true, desc = "Resume" }
)
vim.keymap.set("n", "<leader>nh", ":noh<cr>", { desc = "no highlight" })
--vim.keymap.set({"n","v"}, "<tab>", "%")

-- quick switch to the files cwd
vim.keymap.set("n", "<leader>fcd", ":cd %:p:h<cr>", { desc = "change to file current directory" })
-- vim.keymap.set("n", "<leader>lcd", ":lcd %:p:h<cr>")

-- These only work with C like languages and only if the closing } of a
-- function is on the first column of a new line
-- select the entire function
vim.keymap.set("n", "<Leader>vaf", "][[{V$]}", { desc = "select function" })

-- yank an entire function
vim.keymap.set("n", "<Leader>yaf", "<Leader>vafy", { desc = "yank function" })

-- delete an entire function
vim.keymap.set("n", "<Leader>daf", "<Leader>vafd", { desc = "delete function" })

-- select a block
vim.keymap.set("n", "<Leader>vab", "[{V$]}", { desc = "select block" })

-- yank a block
vim.keymap.set("n", "<Leader>yab", "<Leader>vaby", { desc = "yank block" })

-- delete a block
vim.keymap.set("n", "<Leader>dab", "<Leader>vabd", { desc = "delete block" })

-- Find TODO & FIXME notes
vim.keymap.set("n", "<Leader>todo", "/c<(to(s\\|-)*do)\\|(fix(s\\|-)*me)>/ <cr>", { desc = "go to todos" })

-- Map for reformatting a file
--vim.keymap.set("", "<Leader>rf", "mzgg=G`z<CR>")
vim.keymap.set("n", "<Leader>rf", ":Autoformat<CR>", { remap = true, desc = "reformat file" })
vim.keymap.set("n", "<Leader>rfl", ":AutoformatLine<CR>", { desc = "reformat line" })

-- reformat json files with jq
vim.keymap.set("n", "<Leader>jq", "GVgg :!jq .<cr>", { desc = "reformat json" })

-- Redirect the output of a Vim or external command into a scratch buffer
--function! Redir(cmd) abort
--let output = execute(a:cmd)
--tabnew
--setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
--call setline(1, split(output, "\n"))
--endfunction
--command! -nargs=1 Redir silent call Redir(<f-args>)
