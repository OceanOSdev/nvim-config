vim.g.mapleader = " "

-- remap jj to <ESC> so I don't have to keep hitting esc or <C-[>
vim.keymap.set("i", "jj", "<ESC>", { silent = true })

-- map <Space>y to copy to clipboard (respectively p to paste)
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })

-- split and vsplit shortcuts
vim.keymap.set("n", "<leader>s", function()
	vim.cmd("split")
end, { desc = "Split" })
vim.keymap.set("n", "<leader>vs", function()
	vim.cmd("vsplit")
end, { desc = "Vertical Split" })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- split nav shortcuts
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to the down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to the up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to the right window" })

-- scroll shortcuts
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half a page and center the cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half a page and center the cursor" })

-- redo shortcut
vim.keymap.set("n", "U", "<C-r>", { silent = true, desc = "Redo" })

local function split_and_term()
	vim.cmd("split")
	vim.cmd("term")
end

vim.keymap.set("n", "<leader>t", split_and_term, { desc = "Split and open terminal" })

-- resource config
-- WARN: Does not work
--vim.keymap.set("n", "<leader>r", ":luafile $MYVIMRC<CR>", { desc = "Re-source nvim config" })
