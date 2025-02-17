-- All of the below are plugins. Plugins once loaded can be configured. The ordering matters.
-- Hence, we make use of the `after/` directory to add keymaps

return {
	-- First, we install Telescope, https://github.com/nvim-telescope/telescope.nvim
	-- This is necessary for quick fuzzy finding goodenss
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	-- Then we install a color theme, NightFox
	{ "EdenEast/nightfox.nvim" },

	-- Install Telescope for fancy pulls
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },

	-- Install nvim-notify for notifications
	{ 'rcarriga/nvim-notify' },

	-- Instal LuaLine for status bar
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	-- Install nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "c", "lua", "vim", "javascript", "go", "rust" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },  
		}
	},
	
	-- Github Copilot AI assistant
	{
		"github/copilot.vim"
	},

	-- Github Copilot Chat
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			-- See Configuration section for options
		},
		-- See Commands section for default commands if you want to lazy load on them
	},

	-- Terminal (ToggleTerm)
	-- amongst your other plugins
	{'akinsho/toggleterm.nvim', version = "*", config = true}
}
