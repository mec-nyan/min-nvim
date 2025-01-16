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
			name = 'Nano::lua_ls',
			cmd = { 'lua-language-server' },
			root_dir = vim.fs.root(fname.buf, { 'init.lua' }),
			workspace_folders = nil,
			settings = {
				config = {
					runtime = {
						version = 'LuaJIT',
					},
					single_file_support = true,
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
				},
			},
		})
	end,
})

-- Some commands.
-- TODO: Open the lsp info without line numbers, etc.
-- Add a key binding to close this window with 'q'.
vim.api.nvim_create_user_command('LspCheck', ':vert checkhealth lsp', { desc = 'Nano:: LSP Info' })



return {}
