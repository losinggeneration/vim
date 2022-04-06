vim.opt.modelines = 0

vim.g.use_deoplete = 1

vim.cmd('source ~/.vim/plug.vim')

vim.cmd('highlight TabS term=standout cterm=standout gui=standout')
vim.cmd('highlight STabs term=standout cterm=standout gui=standout')
vim.cmd('highlight link LineEndWS Error')
