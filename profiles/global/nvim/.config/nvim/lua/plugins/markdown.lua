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
			{ "<leader>ie", "<cmd>Inlyne enable<cr>", desc = "Enable Inlyne" },
			{ "<leader>id", "<cmd>Inlyne disable<cr>", desc = "Disable Inlyne" },
			{ "<leader>it", "<cmd>Inlyne toggle<cr>", desc = "Toggle Inlyne" },
		},
		opts = {},
	},
}
