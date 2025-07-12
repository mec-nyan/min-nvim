local prompt = "󰋖 "

vim.api.nvim_create_user_command("HelpPrompt", function()
	vim.ui.input({ prompt = prompt, completion = "help" }, function(topic)
		if topic and topic ~= "" then
			vim.cmd("vertical help " .. topic)
		end
	end)
end, {})

vim.keymap.set("n", "<leader>h", "<cmd>HelpPrompt<CR>", { noremap = true, silent = true })


-- WIP
HelpPopup = function()
	local buf = vim.api.nvim_create_buf(false, true)
	local width = math.floor(vim.o.columns / 3)
	local height = 1
	local row = math.floor((vim.o.lines - height) / 3)
	local col = math.floor((vim.o.columns - width) / 2)

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		row = row,
		col = col,
		width = width,
		height = height,
		style = "minimal",
		border = "single",
	})

	vim.api.nvim_set_option_value("buftype", "prompt", { buf = buf })
	-- vim.bo[buf].buftype = "prompt"
	vim.bo[buf].omnifunc = "helpcomplete"
	vim.fn.prompt_setprompt(buf, prompt)
	vim.cmd.startinsert()

	vim.keymap.set("i", "<CR>", function()
		local input = vim.api.nvim_get_current_line()
		vim.api.nvim_win_close(win, true)
		if input and input ~= "" then
			vim.cmd("vertical help " .. input)
		end
	end, { buffer = buf })

	vim.keymap.set("i", "<ESC>", function()
		vim.api.nvim_win_close(win, true)
	end, { buffer = buf })
end
