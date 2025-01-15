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
	callback = function(x)
		vim.lsp.start({
			name = 'Nano::lua_ls',
			cmd = { 'lua-language-server' },
		})
	end,
})


return {}
