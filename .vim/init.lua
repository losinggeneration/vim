vim.opt.modelines = 0

vim.g.use_deoplete = false
vim.g.use_cmp = true

--vim.cmd('source ~/.vim/plug.vim')
--require "packer"
require "plugins"
require 'lsp'
require 'line'

vim.cmd('highlight TabS term=standout cterm=standout gui=standout')
vim.cmd('highlight STabs term=standout cterm=standout gui=standout')
vim.cmd('highlight link LineEndWS Error')
