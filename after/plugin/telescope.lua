local function opts(desc)
	return { desc = "telescope: " .. desc }
end

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.current_buffer_fuzzy_find, opts("fuzzy find"))

vim.keymap.set("n", "<leader>da", builtin.diagnostics, opts("diagnostics"))
vim.keymap.set("n", "<leader>de<leader>", function()
	builtin.diagnostics({ severity = vim.diagnostic.severity.ERROR })
end, opts("error diagnostics"))
