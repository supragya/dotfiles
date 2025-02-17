-- We begin by setting the leader key to be the SpaceBar. This has to be
-- set before any other plugins are loaded.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Traditionally, we use `:Ex` to access the netrw directory listing
-- This is unergonomical. Assuming we are using netrw, we will set it to
-- <leader>pv "Project View" for viewing directories
-- However, it may be worth looking into elements like oil.nvim or nvim-tree
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
