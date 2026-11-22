return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local function on_attach_nt(bufnr)
			local api = require("nvim-tree.api")
			-- default mapping
			api.config.mappings.default_on_attach(bufnr)
		end
		require("nvim-tree").setup({
			update_focused_file = { enable = true },
			on_attach = on_attach_nt,
		})
	end,
}
