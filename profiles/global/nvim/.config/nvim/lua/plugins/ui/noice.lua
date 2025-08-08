--- I only use this for the fancy cmdline :p
---@diagnostic disable: missing-fields
return {
	"folke/noice.nvim",
	enabled = true,
	-- version = "*",
	dependencies = { "MunifTanjim/nui.nvim" },
	lazy = false,
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
		---@type table<string, NoiceCommand>
		commands = {
			warn = {
				view = "popup",
				opts = { enter = true, format = "details" },
				filter = { warning = true },
				filter_opts = { reverse = true },
			},
		},
	},
	init = function()
		utils.autocmd({ "ColorScheme", "VimEnter" }, {
			callback = function()
				local hl = vim.api.nvim_get_hl(0, { name = "lualine_c_normal" })
				vim.api.nvim_set_hl(0, "NoiceCmdline", {
					fg = hl.fg,
					bg = hl.bg,
					bold = hl.bold,
					italic = hl.italic,
					underline = hl.underline,
				})
			end,
		})
	end,
}
