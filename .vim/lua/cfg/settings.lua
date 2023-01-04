-- Check for whitespace damage
vim.g.c_space_errors = 1

-- Leader for things like NERDCommenter
vim.g.mapleader = ","

vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4
-- allow backspacing over everything in insert mode
vim.o.backspace = "indent,eol,start"

vim.o.number = true
vim.o.backup = true        -- keep a backup file
vim.o.history = 500        -- keep 500 lines of command line history
vim.o.ruler = true         -- show the cursor position all the time
vim.o.showcmd = true       -- display incomplete commands
vim.o.incsearch = true     -- do incremental searching

-- Some code folding options
vim.o.foldmethod = "syntax"
vim.o.foldnestmax = 10
vim.o.foldenable = false
vim.o.foldlevel = 0

--vim.opt.encoding = "utf-8"
vim.o.scrolloff = 3
vim.o.autoindent = true
vim.o.showmode = true
vim.o.hidden = true
vim.o.wildmenu = true
vim.o.wildmode = "list:longest"
vim.o.visualbell = true
vim.o.cursorline = true
vim.o.ttyfast = true
vim.o.laststatus = 2
vim.o.relativenumber = true
vim.o.undofile = true

vim.o.wrap = true
vim.o.textwidth = 79
vim.o.formatoptions = "qrn1"
vim.o.colorcolumn = "85"

-- search related settings
-- This messes up tab completion with cmp
--vim.keymap.set({"n","v"}, "/", "/\\v")
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.gdefault = true
vim.o.incsearch = true
vim.o.showmatch = true
vim.o.hlsearch = true

vim.o.background = "dark"
-- hack around poorly behaving clients :(
if vim.gui_running then
	vim.cmd.colorscheme("desert")
end

-- Map Esc to exit insert mode in the terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "jj", "<C-\\><C-n>")

-- resize shortcuts
vim.keymap.set("n", "<Leader>-", [[:exe "resize " . (winheight(0) * 1/2)<CR>]], { silent = true })
vim.keymap.set("n", "<Leader>+", [[:exe "resize " . (winheight(0) * 3/2)<CR>]], { silent = true })

-- Map ctrl-[hjkl] to change windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })

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

require("cfg.keymaps")
require("cfg.indention")
require("cfg.spaces")
require("cfg.visual-at")
