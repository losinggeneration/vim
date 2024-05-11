if vim.g.neovide then
	-- vim.opt.guifont = { "Hack Nerd Font Mono" }
	-- vim.opt.guifont = { "Source Code Pro", "h14" }
	-- vim.opt.guifont = { "GoMono Nerd Font Mono" }
	-- vim.opt.guifont = { "FuraCode Nerd Font Mono" }
	vim.opt.guifont = { "FiraCode Nerd Font Mono" }
	vim.g.neovide_scale_factor = 0.6

	vim.g.neovide_hide_mouse_when_typing = true

	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_refresh_rate_idle = 1
end

if vim.g.neoray then
	-- vim.opt.guifont = { "/home/harley/.local/share/fonts/GoMonoNerdFontMono-Regular.ttf" }
	vim.opt.guifont = { "/home/harley/.local/share/fonts/Hack Regular Nerd Font Complete Mono.ttf" }
	vim.cmd([[NeoraySet CursorAnimTime 0.08]])
	vim.cmd([[NeoraySet Transparency   1.00]])
	vim.cmd([[NeoraySet TargetTPS      120]])
	vim.cmd([[NeoraySet ContextMenu    TRUE]])
	vim.cmd([[NeoraySet BoxDrawing     TRUE]])
	vim.cmd([[NeoraySet ImageViewer    TRUE]])
	vim.cmd([[NeoraySet WindowSize     100x40]])
	vim.cmd([[NeoraySet WindowState    centered]])
	vim.cmd([[NeoraySet KeyFullscreen  <M-C-CR>]])
	vim.cmd([[NeoraySet KeyZoomIn      <C-ScrollWheelUp>]])
	vim.cmd([[NeoraySet KeyZoomOut     <C-ScrollWheelDown>]])
end
