--- Options for completion/omnifunc.

local setkey = vim.keymap.set

-- TODO: These are provisory mappings!
-- The idea is to map to a function that can select the correct action.
-- i.e. don't trigger omnifunc when it doesn't belong.
-- It may also provide fuzzy completion "as you type" i.e. if you type "pf"
-- it should suggest "Printf" etc.
--
-- BTW it works relly well anyway 😛
--
-- The next idea comes straight from (neo)Vim's documentation.
-- See (:h E5665)
-- TODO: We can improve this function to trigger omnifunc when typing, etc.
local function CleverTab()
	-- TODO: Use the lua api...
	local str = vim.fn.strpart(vim.fn.getline('.'), 0, vim.fn.col('.')-1)
	local tab = vim.api.nvim_replace_termcodes('<Tab>', false, false, true)
	local omni = vim.api.nvim_replace_termcodes('<C-x><C-o>', false, false, true)
	if string.match(str, '^%s*$') ~= nil then
		-- Shouldn't "mode" be 'i'?
		vim.api.nvim_feedkeys(tab, 'n', false)
	else
		vim.api.nvim_feedkeys(omni, 'n', false)
	end
end

local function CleverOmni()
	local omni = vim.api.nvim_replace_termcodes('<C-x><C-o>', false, false, true)
	local buf = vim.api.nvim_get_current_buf()
	-- TODO: Replace deprecated "buf_get_clients".
	local att = vim.lsp.buf_get_clients(buf)
	vim.api.nvim_feedkeys('.', 'n', false)
	if #att ~= 0 then
		vim.api.nvim_feedkeys(omni, 'n', false)
	end
end

setkey('i', '<Tab>', CleverTab, { desc = "Nano::Tab Complete" })

-- I'll try <Tab> and <C-space> to see wich one I like the most.
setkey('i', '<C-space>', '<C-x><C-o>', { desc = "Nano::Omni Complete" })

setkey('i', '.', CleverOmni, { desc = "Nano::Dot Complete" })
