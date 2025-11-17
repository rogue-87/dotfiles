---@type LazySpec
---@diagnostic disable: missing-fields
return {
	{
		"rogue-87/inlyne.nvim",
		version = "*",
		lazy = false,
		keys = {
			{ "<leader>i", "", desc = "Inlyne" },
			{ "<leader>ie", "<cmd>Inlyne enable<cr>", desc = "Enable Inlyne" },
			{ "<leader>id", "<cmd>Inlyne disable<cr>", desc = "Disable Inlyne" },
			{ "<leader>it", "<cmd>Inlyne toggle<cr>", desc = "Toggle Inlyne" },
		},
		opts = {},
	},
	{

		"chomosuke/typst-preview.nvim",
		lazy = false,
		version = "*",
		opts = {
			dependencies_bin = {
				["tinymist"] = nil,
				["websocat"] = nil,
			},
		},
	},
	{
		"OXY2DEV/markview.nvim",
		version = "*",
		lazy = false,
		dependencies = { "saghen/blink.cmp" },
		opts = function()
			---@type markview.config
			return {
				html = { enable = false },
				latex = { enable = false },
				yaml = { enable = false },
				markdown = {
					enable = true,
					tables = { enable = false },
					code_blocks = { enable = false, style = "block" },
					list_items = { enable = false },
				},
				markdown_inline = {
					enable = true,
					checkboxes = { enable = false },
					entities = { enable = false },
				},

				preview = {
					enable = true,
					enable_hybrid_mode = true,
					map_gx = true,
					debounce = 150,
					raw_previews = {},
					modes = { "n", "no", "c" },
					hybrid_modes = {},

					callbacks = {
						on_enable = function(_, wins)
							for _, win in ipairs(wins) do
								vim.wo[win].conceallevel = 1
								vim.wo[win].concealcursor = "nc"
							end
						end,

						on_disable = function(_, wins)
							for _, win in ipairs(wins) do
								vim.wo[win].conceallevel = 0
								vim.wo[win].concealcursor = ""
							end
						end,

						on_splitview_open = function(_, _, win)
							vim.wo[win].conceallevel = 3
							vim.wo[win].concealcursor = "n"
						end,
					},
				},
			}
		end,
		keys = {
			{ "<leader>um", "<cmd>Markview toggle<cr>", desc = "Toggle Markview" },
		},
	},
	{ "OXY2DEV/markdoc.nvim", opts = {} },
}
