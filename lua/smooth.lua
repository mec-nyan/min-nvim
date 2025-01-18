--[[ Scroll functions to make <C-D>/<C-U> more visual.
--]]

-- TODO: Add ease functions.

local smooth = {}

-- Default delay. Use "setup(delay)" to use a custom delay.
local _delay = 16

function make_callback_next(timer, amount, limit)
	local start = 1
	local ctrl_e = vim.api.nvim_replace_termcodes('<C-e>', false, false, true)
	return function()
		vim.api.nvim_feedkeys(ctrl_e, 'n', false)
		local line = vim.fn.winline()
		if start == amount or line == limit then
			timer:stop()
			timer:close()
		end
		start = start + 1
	end
end

function smooth.scroll_next_w_timer()
	local height = vim.fn.winheight(0)
	local amount = vim.wo.scroll
	local timer = vim.uv.new_timer()
	timer:start(0, _delay, vim.schedule_wrap(make_callback_next(timer, amount, height)))
	-- In case something goes wrong, you can stop this timer.
	return timer
end

function make_callback_prev(timer, amount)
	local start = 1
	local ctrl_y = vim.api.nvim_replace_termcodes('<C-y>', false, false, true)
	return function()
		vim.api.nvim_feedkeys(ctrl_y, 'n', false)
		local line = vim.fn.winline()
		if start == amount or line == 0 then
			timer:stop()
			timer:close()
		end
		start = start + 1
	end
end

function smooth.scroll_prev_w_timer()
	local amount = vim.wo.scroll
	local timer = vim.uv.new_timer()
	timer:start(0, _delay, vim.schedule_wrap(make_callback_prev(timer, amount)))
	-- In case something goes wrong, you can stop this timer.
	return timer
end


--- Sets default delay and adds key bindings to replace <C-u> and <C-d>.
-- @param delay (optional) The delay in ms (default = 16).
function smooth.setup(delay)
	_delay = delay or _delay
	vim.keymap.set('n', '<C-u>', smooth.scroll_prev_w_timer, { desc = "Nano::Prev page" })
	vim.keymap.set('n', '<C-d>', smooth.scroll_next_w_timer, { desc = "Nano::Next page" })
end

return smooth
