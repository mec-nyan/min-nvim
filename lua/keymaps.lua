--[[ Keybindings for Neovim
--]]

local setkey = vim.keymap.set

keybindings = {
	-- Personal preference:
	{ mode = 'n', key = '<C-z>', cmd = ':w<CR>', opts = { desc = 'Nano::Write' } },
	{ mode = 'i', key = '<C-z>', cmd = '<ESC>:w<CR>', opts = { desc = 'Nano::Write' } },
	{ mode = 'n', key = '<ESC>n', cmd = ':tabnew<CR>', opts = { desc = 'Nano::NewTab' } },
	{ mode = 'n', key = '<ESC>q', cmd = ':q<CR>', opts = { desc = 'Nano::Quit' } },
	{ mode = 'n', key = '<ESC>Q', cmd = ':qa<CR>', opts = { desc = 'Nano::QuitAll' } },
	{ mode = 'n', key = '<ESC>o', cmd = ':only<CR>', opts = { desc = 'Nano::Only' } },
	{ mode = 'n', key = '<ESC>w', cmd = ':tabclose<CR>', opts = { desc = 'Nano::CloseTab' } },

	-- LSP
	{ mode = 'n', key = 'K', cmd = ':lua vim.lsp.buf.hover()<CR>', opts = { desc = 'Nano::Hover' } },
	{ mode = 'n', key = '<leader>rn', cmd = ':lua vim.lsp.buf.rename()<CR>', opts = { desc = 'Nano::Hover' } },
}

for _, kb in pairs(keybindings) do
	setkey(kb.mode, kb.key, kb.cmd, kb.opts)
end

return {}
