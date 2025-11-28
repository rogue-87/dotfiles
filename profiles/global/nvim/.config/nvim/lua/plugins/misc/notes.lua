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
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			completions = { lsp = { enabled = true } },
		},
	},
	{ "OXY2DEV/markdoc.nvim", enabled = false, opts = {} },
}
