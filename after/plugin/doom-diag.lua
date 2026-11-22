local function opts(desc)
	return { desc = "DoomGuy: " .. desc }
end

vim.keymap.set("n", "<leader>dg", "<Cmd>DoomToggle<CR>", opts("toggle"))
