require("cfg.settings")
require("plugins")
require("colors")
require("cfg.neovide")

vim.cmd("highlight TabS term=standout cterm=standout gui=standout")
vim.cmd("highlight STabs term=standout cterm=standout gui=standout")
vim.cmd("highlight link LineEndWS Error")
