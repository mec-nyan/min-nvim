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

-- Customise the popup menu.
local item = { bg = "#232635", fg = "#737995" }
local item_sel = { bg = "#232635", fg = "#c6d0f6" }
local kind = { bg = "#232635", fg = "#ca9ee7" }
local kind_sel = { bg = "#232635", fg = "#f4b8e5" }
local extra = { bg = "#232635", fg = "#737995" }
local extra_sel = { bg = "#232635", fg = "#c6d0f6" }
local sbar = { bg = "#111317" }
local thumb = { bg = "#8caaef" }

vim.cmd.highlight({ args = { "Pmenu", "guibg=" .. item.bg, "guifg=" .. item.fg } })
vim.cmd.highlight({ args = { "PmenuSel", "guibg=" .. item_sel.bg, "guifg=" .. item_sel.fg } })
vim.cmd.highlight({ args = { "PmenuKind", "gui=italic", "guibg=" .. kind.bg, "guifg=" .. kind.fg } })
vim.cmd.highlight({ args = { "PmenuKindSel", "gui=italic", "guibg=" .. kind_sel.bg, "guifg=" .. kind_sel.fg } })
vim.cmd.highlight({ args = { "PmenuExtra", "guibg=" .. extra.bg, "guifg=" .. extra.fg } })
vim.cmd.highlight({ args = { "PmenuExtraSel", "guibg=" .. extra_sel.bg, "guifg=" .. extra_sel.fg } })
vim.cmd.highlight({ args = { "PmenuSbar", "guibg=" .. sbar.bg } })
vim.cmd.highlight({ args = { "PmenuThumb", "guibg=" .. thumb.bg } })
vim.cmd.highlight({ args = { "NormalFloat", "guibg=" .. item.bg, "guifg=" .. item_sel.fg } })


return {}
