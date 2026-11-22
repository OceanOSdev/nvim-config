vim.opt.termguicolors = true
vim.opt.guicursor = ""

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.ruler = true
vim.opt.number = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.incsearch = true

-- shorten the time neovim saits before ignoring keybindings
-- from 2 seconds to 0.5
vim.opt.timeoutlen = 500

vim.opt.splitright = true

vim.filetype.add({
	extension = {
		inc = "asm",
	},
})
