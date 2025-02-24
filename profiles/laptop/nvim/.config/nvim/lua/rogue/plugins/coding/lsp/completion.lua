return {
	-- provides compatibility with nvim-cmp sources
	{
		"saghen/blink.compat",
		enabled = true,
		version = "*",
		lazy = true,
		opts = {},
	},
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = { "rafamadriz/friendly-snippets" },
		-- use a release tag to download pre-built binaries
		version = "*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "enter" },

			cmdline = { enabled = false },

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "normal",
			},

			completion = {
				menu = { border = "padded" },
				documentation = { window = { border = "padded" } },
				list = { selection = { preselect = true, auto_insert = false } },
			},
			signature = { window = { border = "single" } },

			snippets = { preset = "default" },
			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
		opts_extend = { "sources.default" },
	},
}
