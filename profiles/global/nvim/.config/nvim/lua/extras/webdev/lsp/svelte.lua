local M = {}

function M.setup()
	vim.lsp.config("svelte", {
		cmd = { "svelteserver", "--stdio" },
		filetypes = { "svelte" },
		root_markers = { "package.json", ".git" },
		settings = {
			-- so I won't get annoyed whenever using tailwindcss
			css = { lint = { unknownAtRules = "ignore" } },
			scss = { lint = { unknownAtRules = "ignore" } },
			less = { lint = { unknownAtRules = "ignore" } },
		},
	})

	vim.lsp.enable("svelte")
end

return M
