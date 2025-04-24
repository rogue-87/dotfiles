--- I only use this for the fancy cmdline :p
---@diagnostic disable: missing-fields
return {
	"folke/noice.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	---@type NoiceConfig
	opts = {
		cmdline = { enabled = true, view = "cmdline" },
		health = { checker = false },
		lsp = {
			hover = { enabled = true },
			message = { enabled = true },
			progress = { enabled = true },
			signature = { enabled = false },
		},
		messages = { enabled = true },
		notify = { enabled = true },
		popupmenu = { enabled = false },
		presets = {
			bottom_search = false,
			cmdline_output_to_split = false,
			command_palette = false,
			inc_rename = false,
			long_message_to_split = false,
			lsp_doc_border = false,
		},
	},
}
