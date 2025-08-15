---@type vim.lsp.Config
return {
	cmd = { "emmylua_ls" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".emmyrc.json",
		".emmyrc.jsonc",
		".luacheckrc",
		".git",
	},
	workspace_required = false,
}
