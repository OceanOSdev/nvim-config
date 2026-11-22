-- this function will use the legacy setup on older version of neovim
-- for compatibility purposes
local function lsp_setup(server, opts)
	if vim.fn.has("nvim-0.11") == 0 then
		require("lspconfig")[server].setup(opts)
		return
	end

	if not vim.tbl_isempty(opts) then
		vim.lsp.config(server, opts)
	end

	vim.lsp.enable(server)
end

lsp_setup("lua", {})
lsp_setup("clangd", {})

vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = true,
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			check = {
				overrideCommand = {
					"cargo",
					"clippy",
					"--workspace",
					"--message-format=json",
					"--all-targets",
					"--all-features",
				},
			},
		},
	},
})
vim.lsp.enable("rust_analyzer")
