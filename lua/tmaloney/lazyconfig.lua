-- Install lazy if needed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load Lazy
require("lazy").setup({
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	require("tmaloney.plugins.treesitter"),
	{ "nvim-treesitter/nvim-treesitter-context" },

	{ "seblyng/roslyn.nvim" },
	require("tmaloney.plugins.lazydev"),
	require("tmaloney.plugins.lspconfig"),
	require("tmaloney.plugins.conform"),
	require("tmaloney.plugins.blink"),
	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		"tpope/vim-fugitive",
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			win = {
				border = "single",
			},
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.2.0",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	require("tmaloney.plugins.nvim_tree"),
	{
		"folke/snacks.nvim",
		priority = 1000,
		opts = {
			image = {
				doc = {
					inline = false,
					float = true,
				},
			},

			picker = {},
		},
	},

	{
		"3rd/image.nvim",
		opts = {
			backend = "kitty", -- Force kitty since I'm on PopOS
			integrations = {
				terminal = {},
			},
			max_width = 100,
			max_heigh = 12,
		},
	},

	{
		"OceanOSdev/doom-diagnostics.nvim",
		dependencies = {
			"3rd/image.nvim",
		},
		opts = {
			force_ascii = false,
			pain_weights = {
				error = 10,
				warning = 5,
				hint = 0,
			},
		},
	},

	-- {
	-- 	"doom-diagnostics",
	-- 	dir = "~/programming/nvim-plugins/doom-diagnostics.nvim",
	-- 	dependencies = { "3rd/image.nvim" },
	-- 	opts = {
	-- 		force_ascii = false,
	-- 	},
	-- },
}, {
	rocks = {
		hererocks = true,
	},
})
