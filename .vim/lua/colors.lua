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
	vim.api.nvim_set_option("termguicolors", false)
elseif matcher(term, "^%s", "tmux", "item", "iterm", "gnome") then
	vim.api.nvim_set_option({ "termguicolors", true })
elseif matcher(term, "^%s", "xterm") ~= "" then
	if (os.getenv("XTERM_VERSION") or os.getenv("KONSOLE_VERSION") or os.getenv("VTE_VERSION")) ~= "" then
		vim.api.nvim_set_option("termguicolors", true)
	else
		vim.api.nvim_set_option("termguicolors", true)
	end
else
	vim.api.nvim_set_option("termguicolors", true)
end
