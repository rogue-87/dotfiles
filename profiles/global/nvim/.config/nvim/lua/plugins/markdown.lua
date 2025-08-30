---@diagnostic disable: missing-fields
return {
	{
		"OXY2DEV/markview.nvim",
		enabled = true,
		lazy = false,
		priority = 49,
		---@type markview.config
		opts = {
			html = { enable = false },
			latex = { enable = false },
			markdown = {
				enable = true,
				tables = { enable = true },
				block_quotes = { default = { title = true } },
				code_blocks = { enable = true, style = "block" },
				headings = { enable = false },
				list_items = { enable = false },
			},
			markdown_inline = {
				enable = false,
				hyperlinks = { enable = false },
				images = { enable = true },
			},
			preview = {
				enable = true,
				filetypes = { "markdown", "codecompanion" },
				ignore_buftypes = {},
			},
		},
	},
	{
		"rogue-87/inlyne.nvim",
		version = "*",
		lazy = false,
		keys = {
			{ "<leader>ie", "<cmd>Inlyne enable<cr>", desc = "Enable Inlyne" },
			{ "<leader>id", "<cmd>Inlyne disable<cr>", desc = "Disable Inlyne" },
			{ "<leader>it", "<cmd>Inlyne toggle<cr>", desc = "Toggle Inlyne" },
		},
		opts = {},
	},
}
