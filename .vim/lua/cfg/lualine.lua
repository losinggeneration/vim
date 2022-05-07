local timer = require("timer")
local t = timer.new({
	on_tick = function() end,
	timeout = nil,
	delay = 1000,
	interval = 1000,
})

t:start()

local function time()
	return os.date("%T")
end

local pomo = function()
	local status = require("pomodoro").statusline()
	if string.match(status, "inactive") then
		return ""
	end

	return status
end

require("lualine").setup({
	options = {
		theme = "gruvbox-material",
		globalstatus = true,
	},
	sections = {
		lualine_c = { "filename", pomo },
		lualine_z = { "location", time },
	},
	extensions = {
		"fugitive",
	},
})
