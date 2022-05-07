-- Check for whitespace damage
vim.g.c_space_errors = 1

-- Leader for things like NERDCommenter
vim.g.mapleader = ","

vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
-- allow backspacing over everything in insert mode
vim.opt.backspace = "indent,eol,start"

vim.opt.number = true
vim.opt.backup = true        -- keep a backup file
vim.opt.history = 500        -- keep 500 lines of command line history
vim.opt.ruler = true         -- show the cursor position all the time
vim.opt.showcmd = true       -- display incomplete commands
vim.opt.incsearch = true     -- do incremental searching

-- Some code folding options
vim.opt.foldmethod = "syntax"
vim.opt.foldnestmax = 10
vim.opt.foldenable = false
vim.opt.foldlevel = 0

--vim.opt.encoding = "utf-8"
vim.opt.scrolloff = 3
vim.opt.autoindent = true
vim.opt.showmode = true
vim.opt.hidden = true
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest"
vim.opt.visualbell = true
vim.opt.cursorline = true
vim.opt.ttyfast = true
vim.opt.laststatus = 2
vim.opt.relativenumber = true
vim.opt.undofile = true

vim.opt.wrap = true
vim.opt.textwidth = 79
vim.opt.formatoptions = "qrn1"
vim.opt.colorcolumn = "85"

-- search related settings
-- This messes up tab completion with cmp
--vim.keymap.set({"n","v"}, "/", "/\\v")
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.hlsearch = true

vim.keymap.set("n", "<leader><space>", ":noh<cr>")
--vim.keymap.set({"n","v"}, "<tab>", "%")

