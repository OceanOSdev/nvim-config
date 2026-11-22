local function opts(desc)
	return { desc = "picker: " .. desc }
end

local picker = require("snacks.picker")

vim.keymap.set("n", "<leader>fp", picker.files, opts("find files"))
vim.keymap.set("n", "<leader>fg", picker.git_files, opts("git files"))
vim.keymap.set("n", "<leader>fs", picker.smart, opts("smart files"))
vim.keymap.set("n", "<leader>/", picker.grep, opts("grep"))

vim.keymap.set("n", "<leader>gb", picker.git_branches, opts("git branches"))
vim.keymap.set("n", "<leader>gs", picker.git_status, opts("git status"))

vim.keymap.set("n", "<leader>D", picker.diagnostics, opts("git status"))
