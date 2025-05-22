vim.lsp.config.marksman = {
	cmd = { "marksman", "server" },
	filetypes = { "markdown", "markdown.mdx" },
	root_markers = { ".git", ".marksman.toml" },
}

vim.lsp.config.tinymist = {
	cmd = { "tinymist" },
	filetypes = { "typst" },
	root_markers = { ".git" },
}

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
