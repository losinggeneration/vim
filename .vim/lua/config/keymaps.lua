-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Map Esc to exit insert mode in the terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "jj", "<C-\\><C-n>")

-- resize shortcuts
vim.keymap.set("n", "<Leader>-", [[:exe "resize " . (winheight(0) * 1/2)<CR>]], { silent = true, desc = "resize -" })
vim.keymap.set("n", "<Leader>+", [[:exe "resize " . (winheight(0) * 3/2)<CR>]], { silent = true, desc = "resize +" })

-- Map W-[left,right,up,down] to change windows
vim.keymap.set("n", "<M-Left>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<M-Right>", "<C-w>l", { silent = true })
vim.keymap.set("n", "<M-Up>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<M-Down>", "<C-w>j", { silent = true })

-- Map vv to vertical split
vim.keymap.set("n", "vv", "<C-w>v", { silent = true })
-- Map vs to horizontal split
vim.keymap.set("n", "vs", "<C-w>s", { silent = true })
-- Map Q to :q
vim.keymap.set("n", "Q", ":q<cr>", { silent = true })

vim.keymap.set("n", "<leader>uH", ":noh<cr>", { desc = "no highlight" })
--vim.keymap.set({"n","v"}, "<tab>", "%")

-- quick switch to the files cwd
vim.keymap.set("n", "<leader>fd", ":cd %:p:h<cr>", { desc = "change to file current directory" })
-- vim.keymap.set("n", "<leader>lcd", ":lcd %:p:h<cr>")

-- These only work with C like languages and only if the closing } of a
-- function is on the first column of a new line
-- select the entire function
-- vim.keymap.set("n", "<Leader>vaf", "][[{V$]}", { desc = "select function" })

-- yank an entire function
-- vim.keymap.set("n", "<Leader>yaf", "<Leader>vafy", { desc = "yank function" })

-- delete an entire function
-- vim.keymap.set("n", "<Leader>daf", "<Leader>vafd", { desc = "delete function" })

-- select a block
-- vim.keymap.set("n", "<Leader>vab", "[{V$]}", { desc = "select block" })

-- yank a block
-- vim.keymap.set("n", "<Leader>yab", "<Leader>vaby", { desc = "yank block" })

-- delete a block
-- vim.keymap.set("n", "<Leader>dab", "<Leader>vabd", { desc = "delete block" })

-- Find TODO & FIXME notes
-- vim.keymap.set("n", "<Leader>xo", "/c<(to(s\\|-)*do)\\|(fix(s\\|-)*me)>/ <cr>", { desc = "go to todos" })

-- Redirect the output of a Vim or external command into a scratch buffer
--function! Redir(cmd) abort
--let output = execute(a:cmd)
--tabnew
--setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
--call setline(1, split(output, "\n"))
--endfunction
--command! -nargs=1 Redir silent call Redir(<f-args>)
