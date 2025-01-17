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

local function start_gopls()
	vim.lsp.start({
		name = 'Nano_gopls',
		cmd = { 'gopls' },
		root_dir = vim.fs.root(0, { 'go.mod' }),
	})
end

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'go',
	callback = start_gopls,
})

local function start_lua_ls()
	local command = { 'lua-language-server' }
	local root = vim.fs.dirname(vim.fs.find({ '.git', 'nvim' }, { upward = true })[1])
	if root == '~/.config/nvim' then
		table.insert(command, '--configpath')
		table.insert(command, '~/.config/nvim/.luarc.json')
	end
	vim.lsp.start({
		name = 'Nano_lua_ls',
		cmd = command,
		root_dir = root,
		workspace_folders = nil,
		-- Settings are now on .luarc.json (And it works!).
		-- settings = { ... }
	})
end

local function stop_ls()
	vim.lsp.stop_client(vim.lsp.get_clients())
end

local function restart_ls()
	stop_ls()
	local ft = vim.filetype.match({buf = 0})
	if ft == 'go' then
		start_gopls()
	elseif ft == 'lua' then
		start_lua_ls()
	end
end

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'lua',
	callback = start_lua_ls,
})

-- Some commands.
vim.api.nvim_create_user_command('LspCheck', ':vert checkhealth lsp', { desc = 'Nano:: LSP Info' })
vim.api.nvim_create_user_command('LspStop', stop_ls, { desc = 'Nano:: LSP Info' })
vim.api.nvim_create_user_command('LspRestart', restart_ls, { desc = 'Nano:: LSP Info' })

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'checkhealth',
	callback = function()
		-- TODO: Can this be done directly from the lua api?
		vim.cmd ":set nonumber norelativenumber"
		vim.cmd ":noremap<buffer> q :close<CR>"
	end
})


return {}
