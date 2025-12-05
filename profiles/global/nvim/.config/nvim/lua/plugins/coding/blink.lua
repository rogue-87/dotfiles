return {
	"Saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = { "rafamadriz/friendly-snippets" },
	-- use a release tag to download pre-built binaries
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "enter" },

		cmdline = { enabled = true, completion = { ghost_text = { enabled = true } } },

		appearance = { nerd_font_variant = "normal" },

		completion = {
			documentation = { window = { border = "padded", scrollbar = true } },
			list = { selection = { preselect = true, auto_insert = false } },
			ghost_text = { enabled = true },
			trigger = { prefetch_on_insert = false },
		},

		signature = { enabled = true },

		snippets = { preset = "default" },
		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
}
