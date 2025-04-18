---@type table<string, vim.lsp.Config>
local configs = {
	marksman = {
		cmd = { "marksman", "server" },
		filetypes = { "markdown", "markdown.mdx" },
		single_file_support = true,
		root_markers = { ".git", ".marksman.toml" },
	},
	tinymist = {
		cmd = { "tinymist" },
		filetypes = { "typst" },
		single_file_support = true,
		root_markers = { ".git" },
	},
}

-- stylua: ignore
for k, v in pairs(configs) do vim.lsp.config[k] = v end
vim.lsp.enable({ "marksman", "tinymist" })

return {
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		opts = {
			html = { enable = false },
			markdown = { enable = true },
			markdown_inline = { enable = true },
			typst = { enable = true },
			yaml = { enable = true },
		},
	},
	-- rendering images(requires a terminal that supports kitty graphics protocol)
	{ "3rd/image.nvim", build = false, opts = { processor = "magick_cli" } },
	-- formatter
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = { formatters_by_ft = { markdown = { "prettierd" } } },
	},
}
