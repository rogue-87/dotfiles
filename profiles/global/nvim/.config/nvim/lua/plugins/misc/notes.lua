---@type LazySpec
---@diagnostic disable: missing-fields
return {
	{
		"yousefhadder/markdown-plus.nvim",
		ft = "markdown", -- Load on markdown files by default
		config = function()
			require("markdown-plus").setup({
				-- Configuration options (all optional)
				enabled = true,
				features = {
					list_management = true, -- List management features
					text_formatting = true, -- Text formatting features
					headers_toc = true, -- Headers + TOC features
					links = true, -- Link management features
					images = true, -- Image link management features
					quotes = true, -- Blockquote toggling feature
					callouts = true, -- GFM callouts/admonitions feature
					code_block = true, -- Code block conversion feature
					table = true, -- Table support features
					footnotes = true, -- Footnotes management features
				},
				footnotes = { -- Footnotes configuration
					section_header = "Footnotes", -- Header for footnotes section
					confirm_delete = true, -- Confirm before deleting footnotes
				},
				keymaps = {
					enabled = true, -- Enable default keymaps (<Plug> available for custom)
				},
				toc = { -- TOC window configuration
					initial_depth = 2,
				},
				callouts = { -- Callouts configuration
					default_type = "NOTE",
					custom_types = {}, -- Add custom types like { "DANGER", "SUCCESS" }
				},
				table = { -- Table sub-configuration
					auto_format = true,
					default_alignment = "left",
					confirm_destructive = true, -- Confirm before transpose/sort operations
					keymaps = {
						enabled = true,
						prefix = "<leader>t",
						insert_mode_navigation = true, -- Alt+hjkl cell navigation
					},
				},
				filetypes = { "markdown" }, -- Filetypes to enable the plugin for
			})
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			completions = { lsp = { enabled = true } },
		},
	},
	{
		"brianhuster/live-preview.nvim",
		dependencies = { "folke/snacks.nvim" },
		opts = {},
	},
	{

		"chomosuke/typst-preview.nvim",
		lazy = false,
		version = "*",
		opts = {
			dependencies_bin = {
				-- why would I need ternary operator if I could do this? xD
				["tinymist"] = vim.fn.exepath("tinymist") ~= "" and vim.fn.exepath("tinymist") or nil,
				["websocat"] = nil,
			},
		},
	},
}
