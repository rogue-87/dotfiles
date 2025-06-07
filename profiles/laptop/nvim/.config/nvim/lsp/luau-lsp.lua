---@type vim.lsp.Config
return {
	cmd = { "luau-lsp", "lsp" },
	filetypes = { "luau" },
	root_markers = {
		".luaurc",
		".luaurc.json",
		".luaurc.jsonc",
		".stylua.toml",
		"stylua.toml",
		".git",
	},
	settings = {
		-- https://github.com/folke/neoconf.nvim/blob/main/schemas/luau_lsp.json
		["luau-lsp"] = {
			completion = {
				enabled = true,
				addParentheses = false,
				imports = { enabled = false },
			},
			diagnostics = {
				workspace = false,
			},
		},
	},
}
