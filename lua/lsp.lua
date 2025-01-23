--- LSP configuration.
-- I've added the prefix "Nano_" to the name of the servers to be able to tell them apart
-- from other (possibly installed) servers and configurations.
-- Feel free to change that to your liking.

--- Some settings.

local border_style = 'rounded'

-- Add a rounded box for these elements:
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
	vim.lsp.handlers.hover, {
		border = border_style,
	}
)

-- Add a rounded box for these elements:
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
	vim.lsp.handlers.hover, {
		border = border_style,
	}
)

-- Add a rounded box for these elements:
vim.diagnostic.config({
	float = { border = border_style }
})

-- TODO: Add LSs for C++ and Python.

--- Start Rust's language server.
-- Depends on "rust-analyzer" being installed (duh!).
-- By default, rustup will install a "thing" called rust-analyzer that does NOT work.
-- Be sure you have a working binary (i.e. install it with "rustup component add rust-analyzer").
local function start_rust_analyzer()
	vim.lsp.start({
		name = 'Nano_rust_analyzer',
		cmd = { 'rust-analyzer' },
		root_dir = vim.fs.root(0, { 'Cargo.toml' }),
		single_file_support = true
	})
end

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'rust',
	callback = start_rust_analyzer,
})

--- Start Go's language server.
-- Depends on "gopls" beng installed.
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

--- Start C/C++'s language server.
-- Depends on "clangd" beng installed.
local function start_clangd()
	vim.lsp.start({
		name = 'Nano_clangd',
		cmd = { 'clangd' },
		root_dir = vim.fs.root(0, { 'Makefile', 'makefile' }),
		single_file_support = true,
	})
end

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'c', 'cpp', 'h', 'hpp' },
	callback = start_clangd,
})

--- Start Lua's language server.
-- Depends on "lua-language-server" being installed.
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
		-- Settings now live on .luarc.json (And it works!).
		-- settings = { ... }
	})
end

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'lua',
	callback = start_lua_ls,
})

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
	elseif ft == 'rust' then
		start_rust_analyzer()
	elseif ft == 'c' or ft == 'cpp' then
		start_clangd()
	end
end

-- Commands.
vim.api.nvim_create_user_command('LspCheck', ':vert checkhealth lsp', { desc = 'Nano:: LSP Info' })
vim.api.nvim_create_user_command('LspStop', stop_ls, { desc = 'Nano:: LSP Info' })
vim.api.nvim_create_user_command('LspRestart', restart_ls, { desc = 'Nano:: LSP Info' })

-- Allow to exit the LSP health/info window with 'q'.
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'checkhealth',
	callback = function()
		-- TODO: Can this be done directly from the lua api?
		vim.cmd ":set nonumber norelativenumber"
		vim.cmd ":noremap<buffer> q :close<CR>"
	end
})


return {}
