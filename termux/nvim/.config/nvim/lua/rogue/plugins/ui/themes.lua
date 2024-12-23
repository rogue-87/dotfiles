return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "warmer",
		},
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
		config = function()
			local palettes = {}
			local specs = {}
			local groups = {}
			require("github-theme").setup({
				options = {
					compile_path = vim.fn.stdpath("cache") .. "/github-theme",
					compile_file_suffix = "_compiled", -- Compiled file suffix
					hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
					hide_nc_statusline = true, -- Override the underline style for non-active statuslines
					transparent = false, -- Disable setting background
					terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
					dim_inactive = false, -- Non focused panes set to alternative background
					module_default = true, -- Default enable value for modules
					styles = { -- Style to be applied to different syntax groups
						comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
						keywords = "bold",
						types = "bold",
					},
					inverse = { -- Inverse highlight for different types
						match_paren = false,
						visual = false,
						search = false,
					},
					darken = { -- Darken floating windows and sidebar-like windows
						floats = true,
						sidebars = {
							enable = true,
							list = {
								"neo-tree",
								"terminal",
							},
						},
					},
					modules = { -- List of various plugins and additional options
						whichkey = { enable = true },
						neotree = { enable = true },
						dapui = { enable = true },
					},
				},
				palettes = palettes,
				specs = specs,
				groups = groups,
			})

			vim.cmd("colorscheme github_dark")
		end,
	},
}
