--[[ LSP configuration.
--]]

local border_style = 'rounded'

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
	vim.lsp.handlers.hover, {
		border = border_style,
	}
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
	vim.lsp.handlers.hover, {
		border = border_style,
	}
)

vim.diagnostic.config({
	float = { border = border_style }
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'go',
	callback = function(x)
		vim.lsp.start({
			name = 'Nano::gopls',
			cmd = { 'gopls' },
			root_dir = vim.fs.root(x.buf, { 'go.mod' }),
		})
	end,
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'lua',
	callback = function(fname)
		vim.lsp.start({
			name = 'Nano_lua_ls',
			-- TODO: Add Neovim's libraries conditionally only when needed.
			cmd = { 'lua-language-server', '--configpath', '~/.config/nvim/.luarc.json' },
			root_dir = vim.fs.dirname(vim.fs.find({ '.git', 'nvim' }, { upward = true })[1]),
			workspace_folders = nil,
			-- Settings are now on .luarc.json (And it works!).
			-- settings = { ... }
		})
	end,
})

-- Some commands.
vim.api.nvim_create_user_command('LspCheck', ':vert checkhealth lsp', { desc = 'Nano:: LSP Info' })

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'checkhealth',
	callback = function()
		-- TODO: Can this be done directly from the lua api?
		vim.cmd ":set nonumber norelativenumber"
		vim.cmd ":noremap<buffer> q :close<CR>"
	end
})


return {}
