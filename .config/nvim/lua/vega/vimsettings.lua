-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- Show both absolute and relative line numbers in gutter
vim.cmd("set nu")
vim.cmd("set rnu")

-- Highlight the current line (the cursor line)
vim.opt.cursorline = true

-- Code Options
-- New lines inherit the indentation of previous lines.
vim.opt.autoindent = true
-- Set tab to 4 spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4


-- Search Options
-- Highlight the search
vim.opt.hlsearch = true
-- Ignore case while searching, not good for code blocks
vim.opt.ignorecase = true
-- However, automatically become case sensitive when search
-- has an upper case letter in it
vim.opt.smartcase = true

-- Miscellaneous Options
-- Make sure to confirm save before quitting
vim.opt.confirm = true
-- Remember long history
vim.opt.history = 2000
-- Set spellchecking
vim.opt.spell = true

-- Always have atleast 5 lines above and below the cursor
vim.opt.scrolloff = 5
