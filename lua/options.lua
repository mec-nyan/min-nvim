-- My options.


vim.g.mapleader = ' '


vim.o.hlsearch = true
vim.o.modeline = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.swapfile = true
vim.o.showmode = true -- True for now. Deactivate if status line shows mode.
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,popup,noinsert'
-- For some reason, append didn't work ...
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.termguicolors = true
vim.o.listchars = 'tab:▏ ,trail:󱁐,nbsp:+,precedes:,extends:' -- Optionally: eol:
vim.o.list = true
vim.o.encoding = 'utf-8'
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.colorcolumn = '100'
vim.o.incsearch = true
vim.o.scrolloff = 4
vim.o.expandtab = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.foldmethod = 'syntax'
vim.o.foldenable = true
vim.o.foldlevel = 3
vim.o.foldcolumn = '1'
vim.o.fillchars = 'fold: ,foldopen:,foldclose:,foldsep:▎'
vim.o.laststatus = 3
