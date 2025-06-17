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
		"selene.toml",
		".git",
	},
	settings = {
		-- https://github.com/folke/neoconf.nvim/blob/main/schemas/luau_lsp.json
		["luau-lsp"] = {
			platform = {
				---@type "standard"|"roblox"
				type = "standard",
			},
			sourcemap = {
				enabled = false,
				-- sourcemapFile = nil,
			},
			completion = {
				enabled = true,
				addParentheses = true,
				imports = { enabled = true },
			},
			diagnostics = { workspace = false },
		},
	},
}
