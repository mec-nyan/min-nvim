--- Nvim native snippets configuration.
vim.keymap.set({ 'i', 's' }, '<Tab>', function()
   if vim.snippet.active({ direction = 1 }) then
	 return '<cmd>lua vim.snippet.jump(1)<cr>'
   else
	 return '<Tab>'
   end
 end, { expr = true })
