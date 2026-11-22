require("catppuccin").setup({
	flavour = "mocha",
	integrations = {
		-- will uncomment when I install the plugins
		cmp = true,
		nvimtree = true,
		treesitter = true,
		telescope = { enabled = true },
	},
})
vim.cmd.colorscheme("catppuccin")
