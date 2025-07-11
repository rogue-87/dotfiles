--- npm install -g @prisma/language-server
---@type vim.lsp.Config
return {
	cmd = { "prisma-language-server", "--stdio" },
	filetypes = { "prisma" },
	settings = {
		prisma = {
			prismaFmtBinPath = "",
		},
	},
	root_markers = { ".git", "package.json" },
}
