---@diagnostic disable: missing-fields
return {
	"folke/which-key.nvim",
	version = "*",
	---@module "which-key"
	---@type wk.Opts
	opts = {
		preset = "helix",
		---@type wk.Win.opts
		win = { border = "single" },
		---@type wk.Spec[]
		spec = {
			{ "<leader>f", desc = "file/find" },
			{ "<leader>l", "<cmd>Lazy<cr>", desc = "Lazy", icon = { icon = "󰒲", color = "blue" } },
			{ "<leader>p", desc = "profiler", icon = { icon = "󰓅", color = "grey" } },
			{ "<leader>r", desc = "run", icon = { icon = "", color = "red" } },
			{ "<leader>s", desc = "search", icon = { icon = "", color = "orange" } },
			{ "<leader>u", desc = "toggles" },
			{ "<leader>w", desc = "write", icon = { icon = "" } },
		},
	},
}
