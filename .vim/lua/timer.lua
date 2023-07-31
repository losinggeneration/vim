local timer = {}
local defaults = {
	delay = 100,
	interval = 100,
	on_tick = nil,
	timer = nil,
}

function timer.new(opts)
	opts = vim.tbl_extend("force", defaults, opts or {})
	local t = setmetatable(opts, { __index = timer })
	return t
end

function timer:start()
	self.started = true
	local timer = vim.loop.new_timer()
	local start_time = vim.loop.hrtime()
	local tick = self.on_tick

	timer:start(
		self.delay,
		self.interval,
		vim.schedule_wrap(function()
			if not self.started then
				return
			end

			local current_time = vim.loop.hrtime()
			if self.timeout and current_time > start_time + self.timeout then
				self:stop()
				return
			end

			if tick then
				tick(self)
			end
		end)
	)

	self.timer = timer

	return self
end

function timer:stop()
	if not self.started then
		return
	end

	self.started = false

	if self.timer then
		self.timer:stop()
		vim.loop.timer_stop(self.timer)
		self.timer = nil
	end

	if self.on_stop then
		self.on_stop()
	end

	return self
end

return {
	new = timer.new,
}
