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
		lazy = false,
		opts = {
			html = { enable = false },
			markdown = { enable = false },
			markdown_inline = { enable = true },
			typst = { enable = false },
			yaml = { enable = false },
		},
	},
	-- formatter
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = function()
			local conform = require("conform")
			conform.setup({ formatters_by_ft = { markdown = { "prettier" } } })
		end,
	},
}
