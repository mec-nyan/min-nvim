--[[ Scroll functions to make <C-D>/<C-U> more visual.
--]]

-- TODO: Add ease functions.
-- TODO: Scroll the page, not the cursor. Keep cursor position relative to the window (like <C-d> does).

local function scroll_next()
	local scrolloff = vim.o.scrolloff
	local height = vim.api.nvim_win_get_height(0)

	local pos = vim.api.nvim_win_get_cursor(0)
	local lines = vim.api.nvim_buf_line_count(0)

	local speed = 16
	for _ = 1, height do
		if pos[1] < (lines - scrolloff) then
			pos[1] = pos[1] + 1
			vim.api.nvim_win_set_cursor(0, pos)
			vim.cmd.sleep(tostring(speed) .. "m")
			vim.cmd("redraw")
		end
	end
end

local function scroll_prev()
	local height = vim.api.nvim_win_get_height(0)

	local pos = vim.api.nvim_win_get_cursor(0)

	local speed = 16
	for _ = 1, height do
		if pos[1] > 1 then
			pos[1] = pos[1] - 1
			vim.api.nvim_win_set_cursor(0, pos)
			vim.cmd.sleep(tostring(speed) .. "m")
			vim.cmd("redraw")
		end
	end
end

vim.keymap.set('n', '<C-u>', scroll_prev, { desc = "Nano::Prev page" })
vim.keymap.set('n', '<C-d>', scroll_next, { desc = "Nano::Next page" })
