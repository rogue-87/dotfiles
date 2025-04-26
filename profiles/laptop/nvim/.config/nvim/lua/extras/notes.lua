---@type table<string, vim.lsp.Config>
local configs = {
	marksman = {
		cmd = { "marksman", "server" },
		filetypes = { "markdown", "markdown.mdx" },
		root_markers = { ".git", ".marksman.toml" },
	},
	tinymist = {
		cmd = { "tinymist" },
		filetypes = { "typst" },
		root_markers = { ".git" },
	},
}

-- stylua: ignore
for k, v in pairs(configs) do vim.lsp.config[k] = v end
vim.lsp.enable({ "marksman", "tinymist" })

return {
	{
		"OXY2DEV/markview.nvim",
		enabled = false,
		lazy = false,
		opts = {
			html = { enable = false },
			markdown = { enable = true },
			markdown_inline = { enable = true },
			typst = { enable = true },
			yaml = { enable = true },
		},
	},
}
