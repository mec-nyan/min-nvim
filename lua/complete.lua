--- Options for completion/omnifunc.

local setkey = vim.keymap.set

-- TODO: These are provisory mappings!
-- The idea is to map to a function that can select the correct action.
-- i.e. don't trigger omnifunc when it doesn't belong.
-- It may also provide fuzzy completion "as you type" i.e. if you type "pf"
-- it should suggest "Printf" etc.
--
-- BTW it works relly well anyway 😛
setkey('i', '<Tab>', '<C-x><C-o>', { desc = "Nano::Tab Complete" })
-- I'll try <Tab> and <C-space> to see wich one I like the most.
setkey('i', '<C-space>', '<C-x><C-o>', { desc = "Nano::Omni Complete" })
setkey('i', '.', '.<C-x><C-o>', { desc = "Nano::Dot Complete" })
