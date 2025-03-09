return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@module "snacks"
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		scroll = { enabled = true },
		indent = { enabled = true, animate = { enabled = false } },
		-- input = { enabled = true },
		-- picker = { enabled = true },
		-- notifier = { enabled = true },
		-- quickfile = { enabled = true },
		scope = { enabled = true },
		-- statuscolumn = { enabled = true },
		words = { enabled = true },
	},
}
