--- Colorscheme options.
--
-- Requires the colorscheme to be installed, i.e. in */site/pack/*/start/*
-- I'm using "Catppuccin" (https://github.com/catppuccin/nvim) without a plugin manager.
-- (Believe me, you don't need it)
--
-- I always match my terminal colorscheme with nvim's, so transparent backgrounds work great
-- (And look very nice indeed!).

require "catppuccin".setup { transparent_background = true }

vim.cmd.colorscheme "catppuccin-frappe"

return {}
