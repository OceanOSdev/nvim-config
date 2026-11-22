local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

local buf_pre_w = augroup("BufPreW", {})

autocmd("BufWritePre", {
	group = buf_pre_w,
	callback = function(opts)
		print(vim.bo[opts.buf].filetype)
		if vim.bo[opts.buf].filetype == "make" then
			print("makdefile detected, setting expandtab to false")
			vim.opt.expandtab = false
		end
	end,
})

local function buildLatexOnSave(opts)
	-- Write current buffer if modified
	-- TODO: Should we find a way to use opts.buf instead of
	-- assuming the buffer? I don't think this currently should
	-- cause issues, but something to consider
	vim.cmd("update")
	-- local fullPath = vim.api.nvim_buf_get_name(opts.buf) -- causes too much hassle
	-- local cwd = vim.fn.getcwd() -- don't need at the moment
	local relPath = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(opts.buf), ":.")
	local pdfPath = string.gsub(relPath, ".tex", ".pdf")
	local command = "make " .. pdfPath
	-- check if we can run make "[path/to/pdf]"
	local dryrun = vim.fn.system(command .. " --dry-run")

	if vim.v.shell_error ~= 0 then
		-- if there's no target or makefile, just run
		-- the pdflatex command twice with the file path
		-- name
		local backupCmd = "pdflatex " .. relPath
		command = backupCmd .. "; " .. backupCmd
	end
	--print("Going to run: " .. command)

	local result = vim.fn.system(command)
	print(result)
end

autocmd("FileType", {
	pattern = "tex",
	callback = function(opts)
		vim.keymap.set("n", " b", function()
			buildLatexOnSave(opts)
		end, { buffer = true, desc = "save and build tex file" })
	end,
})
