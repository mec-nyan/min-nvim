--[[ Keybindings for Neovim
--]]

local setkey = vim.keymap.set

local keybindings = {
	normal = {
		-- Personal preference:
		{ key = '<C-z>',      cmd = ':w<CR>',                                 opts = { desc = 'Nano::Write' } },
		{ key = '<ESC>n',     cmd = ':tabnew<CR>',                            opts = { desc = 'Nano::NewTab' } },
		{ key = '<ESC>q',     cmd = ':q<CR>',                                 opts = { desc = 'Nano::Quit' } },
		{ key = '<ESC>Q',     cmd = ':qa<CR>',                                opts = { desc = 'Nano::QuitAll' } },
		{ key = '<ESC>o',     cmd = ':only<CR>',                              opts = { desc = 'Nano::Only' } },
		{ key = '<ESC>w',     cmd = ':tabclose<CR>',                          opts = { desc = 'Nano::CloseTab' } },
		-- LSP
		{ key = 'K',          cmd = ':lua vim.lsp.buf.hover()<CR>',           opts = { desc = 'Nano::Hover' } },
		{ key = '<leader>rn', cmd = ':lua vim.lsp.buf.rename()<CR>',          opts = { desc = 'Nano::LSP Rename' } },
		{ key = '<leader>ca', cmd = ':lua vim.lsp.buf.code_action()<CR>',     opts = { desc = 'Nano::LSP Code action' } },
		{ key = 'gd',         cmd = ':lua vim.lsp.buf.declaration()<CR>',     opts = { desc = 'Nano::LSP Declaration' } },
		{ key = '<leader>gd', cmd = ':lua vim.lsp.buf.definition()<CR>',      opts = { desc = 'Nano::LSP Definition' } },
		{ key = '<leader>gt', cmd = ':lua vim.lsp.buf.type_definition()<CR>', opts = { desc = 'Nano::LSP Definition' } },
		{ key = '<leader>gI', cmd = ':lua vim.lsp.buf.implementation()<CR>',  opts = { desc = 'Nano::LSP Implementation' } },
		{ key = '<leader>gr', cmd = ':lua vim.lsp.buf.references()<CR>',      opts = { desc = 'Nano::LSP References' } },
		{ key = '<leader>ss', cmd = ':lua vim.lsp.buf.document_symbol()<CR>', opts = { desc = 'Nano::LSP Symbols' } },
		{ key = '<leader>sh', cmd = ':lua vim.lsp.buf.signature_help()<CR>',  opts = { desc = 'Nano::LSP Symbols' } },
		{ key = '<leader>ff', cmd = ':lua vim.lsp.buf.format()<CR>',          opts = { desc = 'Nano::LSP Format' } },
		{ key = ']e',         cmd = ':lua vim.diagnostic.open_float()<CR>',   opts = { desc = 'Nano::Diagnostic Open' } },
		{ key = ']d',         cmd = ':lua vim.diagnostic.goto_next()<CR>',    opts = { desc = 'Nano::Diagnostic next' } },
		{ key = '[d',         cmd = ':lua vim.diagnostic.goto_prev()<CR>',    opts = { desc = 'Nano::Diagnostic previous' } },
	},
	insert = {
		{ key = '<C-z>', cmd = '<ESC>:w<CR>', opts = { desc = 'Nano::Write' } },
	},

}

for _, kb in pairs(keybindings.normal) do
	setkey('n', kb.key, kb.cmd, kb.opts)
end

for _, kb in pairs(keybindings.insert) do
	setkey('i', kb.key, kb.cmd, kb.opts)
end

return {}
