local function matcher(s, fmt, ...)
	local opts = { ... }
	if #opts > 0 then
		for _, o in ipairs(opts) do
			local m = s:match(fmt:format(fmt, o))
			if m then
				return m
			end
		end
	else
		return s:match(fmt)
	end
end

local term = os.getenv("TERM")
if matcher(term, "^%s", "rxvt", "screen", "putty") then
	vim.opt.termguicolors = false
elseif matcher(term, "^%s", "tmux", "item", "iterm", "gnome") then
	vim.opt.termguicolors = true
elseif matcher(term, "^%s", "xterm") ~= "" then
	if (os.getenv("XTERM_VERSION") or os.getenv("KONSOLE_VERSION") or os.getenv("VTE_VERSION")) ~= "" then
		vim.opt.termguicolors = true
	else
		vim.opt.termguicolors = true
	end
else
	vim.opt.termguicolors = false
end

vim.o.background = "dark"
-- hack around poorly behaving clients :(
if vim.gui_running then
	vim.cmd.colorscheme("desert")
end

require("gruvbox").setup({
	contrast = "soft",
})

vim.cmd.colorscheme("gruvbox")
