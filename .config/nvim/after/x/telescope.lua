-- This file executes after Telescope is loaded successfully

-- We begin by getting a handle over some of the telescope's built-ins
local telescope_builtin = require("telescope.builtin")

-- For finding files, we do "<leader>ff" (find files)
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, {})

-- For finding Git files, we do "<leader>fgf" (find git files)
vim.keymap.set("n", "<leader>fgf", telescope_builtin.git_files, {})

-- For finding Grep string, we do "<leader>fgs" (find grep string)
vim.keymap.set("n", "<leader>fgs", function()
	telescope_builtin.grep_string({ search = vim.fn.input("Find string >> ") });
end) 
