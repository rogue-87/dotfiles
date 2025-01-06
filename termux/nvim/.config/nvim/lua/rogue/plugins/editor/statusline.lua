return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			globalstatus = true,
			disabled_filetypes = {},
			always_divide_middle = false,
			extensions = { "neo-tree", "lazy" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff" },
			lualine_c = { "filename", "diagnostics" },
			lualine_x = {
				{
					require("noice").api.status.command.get,
					cond = require("noice").api.status.command.has,
					color = { fg = "#ff9e64" },
				},
				{
					require("noice").api.status.mode.get,
					cond = require("noice").api.status.mode.has,
					color = { fg = "#ff9e64" },
				},
				"encoding",
				-- "fileformat",
				"filetype",
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
	},
}
