-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Check for whitespace damage
vim.g.c_space_errors = 1

-- Modelines have been a source of issue in the past, we'll use a plugin for this
vim.o.modelines = 0

-- Leader for things like NERDCommenter
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4
-- allow backspacing over everything in insert mode
vim.o.backspace = "indent,eol,start"

vim.o.number = true
vim.o.backup = true -- keep a backup file
vim.o.history = 500 -- keep 500 lines of command line history
vim.o.ruler = true -- show the cursor position all the time
vim.o.showcmd = true -- display incomplete commands
vim.o.incsearch = true -- do incremental searching

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
vim.o.cmdheight = 1

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

-- disable most plugins, leaving Lazy & some color schemes
-- vim.g.disable_lazy_plugins = true
-- vim.g.disable_extra_plugins = vim.g.disable_lazy_plugins or true

-- extras should be defined in local.lua if they're desired locally
-- vim.g.local_config_extras_enable_rust = true
-- vim.g.local_config_extras_enable_clangd = true
-- vim.g.local_config_extras_enable_typescript = true
-- vim.g.local_config_extras_enable_python = true
-- vim.g.local_config_extras_enable_elixir = true
-- vim.g.local_config_extras_enable_sql = true
--
-- vim.g.local_config_extras_enable_cmake = true
-- vim.g.local_config_extras_enable_markdown = true
-- vim.g.local_config_extras_enable_terraform = true
-- vim.g.local_config_extras_enable_yaml = true
-- vim.g.local_config_extras_enable_toml = true
-- vim.g.local_config_extras_enable_json = true

vim.o.clipboard = "unnamedplus"

local function paste(reg)
	return {
		vim.fn.split(vim.fn.getreg(reg), "\n"),
		vim.fn.getregtype(""),
	}
end

vim.g.clipboard = {
	name = "OSC 52",
	copy = {
		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
	},
	paste = {
		["+"] = paste("+"),
		["*"] = paste("*"),
	},
}

pcall(function()
	require("config.local")
end)
require("config.gui")
require("config.indention")
require("config.spaces")
require("config.visual-at")
