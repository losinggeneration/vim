vim.opt.modelines = 0

require 'plugins'

vim.cmd('highlight TabS term=standout cterm=standout gui=standout')
vim.cmd('highlight STabs term=standout cterm=standout gui=standout')
vim.cmd('highlight link LineEndWS Error')
