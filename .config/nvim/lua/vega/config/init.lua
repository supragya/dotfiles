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
vim.keymap.set("n", "<leader>fgg", telescope_builtin.git_files, {})

-- Live Grep
vim.keymap.set("n", "<leader>fgl", telescope_builtin.live_grep, {})

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

-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

-- These are just examples. Replace them with the language
-- servers you have installed in your system
require('lspconfig').rust_analyzer.setup({})

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({}),
})

if vim.lsp.inlay_hint then
  vim.keymap.set("n", "<leader>ih",
  function() if vim.lsp.inlay_hint.is_enabled() then vim.lsp.inlay_hint.enable(false, { bufnr }) else vim.lsp.inlay_hint.enable(true, { bufnr }) end end, {})
end
