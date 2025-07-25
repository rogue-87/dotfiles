return {
	{
		"OXY2DEV/markview.nvim",
		enabled = false,
		lazy = false,
		priority = 49,
	},
	{
		"rogue-87/inlyne.nvim",
		keys = {
			{ "<leader>ie", "<cmd>Inlyne enable<cr>", desc = "Start Inlyne" },
			{ "<leader>id", "<cmd>Inlyne disable<cr>", desc = "Stops Inlyne" },
			{ "<leader>it", "<cmd>Inlyne enable<cr>", desc = "Toggles Inlyne" },
		},
		opts = {},
	},
}
