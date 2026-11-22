return {
	settings = {
		clangd = {
			InlayHints = {
				Designators = true,
				Enabled = true,
				ParameterNames = true,
				DeducedTypes = true,
			},
		},
		fallbackFlags = { "-std=c++20" },
	},
	filetypes = { "c", "cpp" },

	cmd = {
		"clangd",
		"--clang-tidy",
		"--background-index",
		"--fallback-style=llvm",
		"--offset-encoding=utf-16",
		"--completion-style=detailed",
	},
}
