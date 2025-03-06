return {
	"folke/which-key.nvim",
	dependencies = {
		"echasnovski/mini.icons",
	},
	event = "VeryLazy",
	opts = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>f", desc = "file/find" },
			{ "<leader>t", desc = "treesitter", icon = { icon = "", color = "green" } },
			{ "<leader>m", desc = "manage", icon = { icon = "", color = "grey" } },
		})
		---@type wk.Opts
		return { preset = "helix" }
	end,
}
