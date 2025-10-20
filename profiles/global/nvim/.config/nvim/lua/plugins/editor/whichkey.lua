---@diagnostic disable: missing-fields
return {
	"folke/which-key.nvim",
	version = "*",
	event = "VeryLazy",
	---@module "which-key"
	---@type wk.Opts
	opts = {
		preset = "helix",
		---@type wk.Win.opts
		win = { border = "single" },
		---@type wk.Spec
		spec = {
			{ "<leader>f", desc = "file/find" },
			{ "<leader>m", desc = "manage", icon = { icon = "", color = "grey" } },
			{ "<leader>p", desc = "profiler", icon = { icon = "󰓅", color = "grey" } },
			{ "<leader>r", desc = "run", icon = { icon = "", color = "red" } },
			{ "<leader>s", desc = "search", icon = { icon = "", color = "orange" } },
			{ "<leader>t", desc = "treesitter", icon = { icon = "", color = "green" } },
			{ "<leader>u", desc = "toggles" },
			{ "<leader>w", desc = "write", icon = { icon = "" } },
			{ "<localleader>b", desc = "buffer" },
			{ "<localleader>c", desc = "code", icon = { icon = "", color = "orange" } },
			{ "<localleader>d", desc = "document", icon = { icon = "󰈙", color = "green" } },
			{ "<localleader>g", desc = "goto", icon = { icon = "", color = "orange" } },
			{ "<localleader>l", desc = "line", icon = "" },
			{ "<localleader>p", desc = "peek", icon = { icon = "", color = "green" } },
			{ "<localleader>r", desc = "rename", icon = { icon = "", color = "orange" } },
			{ "<localleader>u", desc = "toggles" },
			{ "<localleader>w", desc = "workspace", icon = "󱇙" },
		},
	},
}
