-- This file intends to configure all the plugins after they have been set up

print("Plugins configurator!")

-- Set up the colorscheme, we chose a light theme
vim.cmd("colorscheme duskfox")

-- Setup Telescope

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

-- For finding open buffers
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})

-- For changing colorschemes
vim.keymap.set('n', '<leader>cs', telescope_builtin.colorscheme, {})

-- Setup LuaLine
require("vega.config.lualinecfg")

-- Terminal Window Mappings
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- On pressing <leader>ttt, we toggle the terminal
vim.keymap.set("n", "<leader>ttt", [[<Cmd>lua require('toggleterm').toggle()<CR>]], { noremap = true, silent = true })

-- On pressing <leader>tt1, we toggle the first terminal
vim.keymap.set("n", "<leader>tt1", [[<Cmd>lua require('toggleterm').toggle(1)<CR>]], { noremap = true, silent = true })

-- On pressing <leader>tt2, we toggle the second terminal
vim.keymap.set("n", "<leader>tt2", [[<Cmd>lua require('toggleterm').toggle(2)<CR>]], { noremap = true, silent = true })

-- On pressing <leader>tt3, we toggle the third terminal
vim.keymap.set("n", "<leader>tt3", [[<Cmd>lua require('toggleterm').toggle(3)<CR>]], { noremap = true, silent = true })

-- On pressing <leader>tt4, we toggle the fourth terminal
vim.keymap.set("n", "<leader>tt4", [[<Cmd>lua require('toggleterm').toggle(4)<CR>]], { noremap = true, silent = true })

-- On pressing <leader>tt5, we toggle the fifth terminal
vim.keymap.set("n", "<leader>tt5", [[<Cmd>lua require('toggleterm').toggle(5)<CR>]], { noremap = true, silent = true })

-- LSP Zero
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

if vim.lsp.inlay_hint then
  vim.keymap.set("n", "<leader>L",
  function() if vim.lsp.inlay_hint.is_enabled() then vim.lsp.inlay_hint.enable(false, { bufnr }) else vim.lsp.inlay_hint.enable(true, { bufnr }) end end, {})
end
