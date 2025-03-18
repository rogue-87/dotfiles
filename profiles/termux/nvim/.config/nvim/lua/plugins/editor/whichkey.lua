return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>f", desc = "file/find" },
			{ "<leader>m", desc = "manage", icon = { icon = "", color = "grey" } },
			{ "<leader>r", desc = "run", icon = { icon = "", color = "red" } },
			{ "<leader>s", desc = "search", icon = { icon = "", color = "orange" } },
			{ "<leader>t", desc = "treesitter", icon = { icon = "", color = "green" } },
			{ "<leader>u", desc = "toggles" },
			{ "<leader>w", desc = "write", icon = { icon = "" } },
			{ "<localleader>u", desc = "toggles" },
		})
		---@type wk.Opts
		return { preset = "helix" }
	end,
}
