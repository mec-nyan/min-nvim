vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function ()
		local opts = { buffer = true, noremap = true, silent = true }

		vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
		vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
		vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
		vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
	end
})
