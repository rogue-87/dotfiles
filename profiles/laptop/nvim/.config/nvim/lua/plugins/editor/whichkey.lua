return {
	"folke/which-key.nvim",
	dependencies = {
		-- "nvim-tree/nvim-web-devicons",
		"echasnovski/mini.icons",
	},
	event = "VeryLazy",
	opts = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>t", desc = "treesitter" },
			{ "<leader>f", desc = "file/find" },
			{ "<leader>m", desc = "manage", icon = { icon = "", color = "grey" } },
		})
		---@type wk.Opts
		return {}
	end,
}
