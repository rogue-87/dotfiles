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
			-- too lazy to properly configure this :p
			local spec = package.loaded["markview.spec"]
			---@type markview.config
			return {
				markdown = {
					enable = true,
					tables = { enable = false },
					code_blocks = {
						enable = true,
						style = "block",
						label_direction = "right",
						sign = true,
						pad_amount = 2,
					},
				},
				markdown_inline = {
					enable = true,
				},
			}
		end,
	},
	{ "OXY2DEV/markdoc.nvim", opts = {} },
}
