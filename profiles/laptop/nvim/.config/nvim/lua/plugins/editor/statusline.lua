return {
	"nvim-lualine/lualine.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	---@module "lualine"
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
					function()
						local rec = vim.fn.reg_recording()
						if rec ~= "" then
							return "Recording @" .. rec
						end
						return ""
					end,
					-- stylua: ignore
					color = function() return { fg = "#ff9e64" } end,
				},
				"encoding",
				"filetype",
			},
			lualine_y = {
				{ "progress", separator = " ", padding = { left = 1, right = 0 } },
				{ "location", padding = { left = 0, right = 1 } },
			},
			-- stylua: ignore
			lualine_z = { function() return "  " .. os.date("%I:%M %p ") end, },
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
