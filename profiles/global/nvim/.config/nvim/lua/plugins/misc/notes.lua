---@type LazySpec
---@diagnostic disable: missing-fields
return {
	{
		"vihu/penview.nvim",
		enabled = false,
		build = function()
			require("penview.build").install()
		end,
		ft = "markdown",
		opts = { browser = "firefox" },
		keys = {
			{ "<leader>po", "<cmd>PenviewStart<cr>", desc = "[P]review [O]pen" },
			{ "<leader>pc", "<cmd>PenviewStop<cr>", desc = "[P]review [C]lose" },
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
	{

		"chomosuke/typst-preview.nvim",
		lazy = false,
		version = "*",
		opts = {
			dependencies_bin = {
				-- why would I need ternary operator if I could do this? xD
				["tinymist"] = vim.fn.exepath("tinymist") ~= "" and vim.fn.exepath("tinymist") or nil,
				["websocat"] = nil,
			},
		},
	},
}
