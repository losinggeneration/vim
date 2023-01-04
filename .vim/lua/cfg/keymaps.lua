vim.keymap.set("n", "<leader><space>", ":noh<cr>")
--vim.keymap.set({"n","v"}, "<tab>", "%")

-- quick switch to the files cwd
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<cr>")
vim.keymap.set("n", "<leader>lcd", ":lcd %:p:h<cr>")

-- These only work with C like languages and only if the closing } of a
-- function is on the first column of a new line
-- select the entire function
vim.keymap.set("n", "<Leader>vaf", "][[{V$]}")

-- yank an entire function
vim.keymap.set("n", "<Leader>yaf", "<Leader>vafy")

-- delete an entire function
vim.keymap.set("n", "<Leader>daf", "<Leader>vafd")

-- select a block
vim.keymap.set("n", "<Leader>vab", "[{V$]}")

-- yank a block
vim.keymap.set("n", "<Leader>yab", "<Leader>vaby")

-- delete a block
vim.keymap.set("n", "<Leader>dab", "<Leader>vabd")

-- Sideways helpers
vim.keymap.set("n", "<Leader>sl", ":SidewaysLeft<CR>")
vim.keymap.set("n", "<Leader>sr", ":SidewaysRight<CR>")

-- Find TODO & FIXME notes
vim.keymap.set("n", "<Leader>todo", "/c<(to(s\\|-)*do)\\|(fix(s\\|-)*me)>/ <cr>")

-- Map for reformatting a file
--vim.keymap.set("", "<Leader>rf", "mzgg=G`z<CR>")
vim.keymap.set("", "<Leader>rf", ":Autoformat<CR>")
vim.keymap.set("", "<Leader>rfl", ":AutoformatLine<CR>")

-- reformat json files with jq
vim.keymap.set("n", "<Leader>jq", "GVgg :!jq .<cr>")

-- Redirect the output of a Vim or external command into a scratch buffer
--function! Redir(cmd) abort
    --let output = execute(a:cmd)
    --tabnew
    --setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
    --call setline(1, split(output, "\n"))
--endfunction
--command! -nargs=1 Redir silent call Redir(<f-args>)
