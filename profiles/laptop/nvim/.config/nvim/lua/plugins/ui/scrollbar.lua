---@diagnostic disable: missing-fields
return {
	"lewis6991/satellite.nvim",
	version = "*",
	lazy = false,
	---@module "satellite"
	---@type SatelliteConfig
	opts = {
		current_only = false,
		winblend = 50,
		zindex = 40,
		excluded_filetypes = { "neo-tree" },
		width = 2,
		handlers = {
			diagnostic = { enable = true },
			gitsigns = { enable = false },
			marks = { enable = true },
			search = { enable = true },
		},
	},
}
