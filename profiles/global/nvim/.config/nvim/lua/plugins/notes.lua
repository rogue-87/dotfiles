---@type LazySpec
---@diagnostic disable: missing-fields
return {
	{
		"rogue-87/inlyne.nvim",
		version = "*",
		lazy = false,
		keys = {
			{ "<leader>i", "", desc = "Inlyne" },
			{ "<leader>ie", "<cmd>Inlyne enable<cr>", desc = "Enable Inlyne" },
			{ "<leader>id", "<cmd>Inlyne disable<cr>", desc = "Disable Inlyne" },
			{ "<leader>it", "<cmd>Inlyne toggle<cr>", desc = "Toggle Inlyne" },
		},
		opts = {},
	},
	{

		"chomosuke/typst-preview.nvim",
		lazy = false,
		version = "*",
		opts = {
			dependencies_bin = {
				["tinymist"] = nil,
				["websocat"] = nil,
			},
		},
	},
	{
		"OXY2DEV/markview.nvim",
		version = "*",
		lazy = false,
		dependencies = { "saghen/blink.cmp" },
		opts = function()
			---@type markview.config
			return {
				html = { enable = false },
				latex = { enable = false },
				yaml = { enable = false },
				markdown = {
					enable = true,
					tables = { enable = false },
					code_blocks = { enable = true, style = "block" },
					list_items = { enable = false },
				},
				markdown_inline = {
					enable = true,
					checkboxes = { enable = false },
					entities = { enable = false },
				},
			}
		end,
	},
	{ "OXY2DEV/markdoc.nvim", opts = {} },
}
