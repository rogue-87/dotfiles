return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim" },
    -- stylua: ignore
    keys = {
        { "<leader>n", "", desc = "Noice"  },
        { "<leader>na", function() require("noice").cmd("all")      end, desc = "All",              },
        { "<leader>nl", function() require("noice").cmd("last")     end, desc = "Last message",     },
        { "<leader>ne", function() require("noice").cmd("errors")   end, desc = "Errors",     },
        { "<leader>nh", function() require("noice").cmd("history")  end, desc = "Message history",  },
        { "<c-esc>",    function() require("noice").cmd("dismiss")  end, desc = "Dismiss all",      },
        { "<C-f>",
            function()
                if not require("noice.lsp").scroll(4) then
                    return "<c-f>"
                end
            end,
			silent = true, expr = true, desc = "Scroll Forward", mode = { "i", "n", "s" },
        },
        { "<C-b>",
            function()
                if not require("noice.lsp").scroll(-4) then
                    return "<c-b>"
                end
            end,
            silent = true, expr = true, desc = "Scroll Backward", mode = { "i", "n", "s" },
        },
    },
	---@type NoiceConfig
	opts = {
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			opts = {}, -- global options for the cmdline. See section on views
			---@type table<string, CmdlineFormat>
			format = {
				cmdline = { pattern = "^:", icon = "", lang = "vim" },
				search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
				lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
				help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
				input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
				-- lua = false, -- to disable a format, set to `false`
			},
		},
		messages = {
			enabled = true,
			view = "mini",
			view_warn = "mini",
			view_error = "mini",
			view_history = "messages",
			view_search = "virtualtext",
		},
		popupmenu = {
			enabled = true,
			---@type 'nui'|'cmp'
			backend = "nui",
			---@type NoicePopupmenuItemKind|false
			kind_icons = {},
		},
		---@type NoiceRouteConfig
		redirect = {
			view = "popup",
			filter = { event = "msg_show" },
		},
		---@type table<string, NoiceCommand>
		commands = {
			---@diagnostic disable-next-line: missing-fields
			history = {
				-- options for the message history that you get with `:Noice`
				view = "popup",
				opts = { enter = true, format = "details" },
				filter = {
					any = {
						{ event = "notify" },
						{ error = true },
						{ warning = true },
						{ event = "msg_show", kind = { "" } },
						{ event = "lsp", kind = "message" },
					},
				},
			},
			-- :Noice last
			last = {
				view = "mini",
				opts = { enter = true, format = "details" },
				filter = {
					any = {
						{ event = "notify" },
						{ error = true },
						{ warning = true },
						{ event = "msg_show", kind = { "" } },
						{ event = "lsp", kind = "message" },
					},
				},
				filter_opts = { count = 1 },
			},
			-- :Noice errors
			errors = {
				-- options for the message history that you get with `:Noice`
				view = "popup",
				opts = { enter = true, format = "details" },
				filter = { error = true },
				filter_opts = { reverse = true },
			},
			-- :Noice all
			all = {
				view = "popup",
				opts = { enter = true, format = "details" },
				filter = {},
				filter_opts = {},
			},
		},
		notify = {
			enabled = true,
			view = "mini",
		},
		lsp = {
			progress = {
				enabled = true,
				-- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
				-- See the section on formatting for more details on how to customize.
				--- @type NoiceFormat|string
				format = "lsp_progress",
				--- @type NoiceFormat|string
				format_done = "lsp_progress_done",
				throttle = 1000 / 30, -- frequency to update lsp progress message
				view = "mini",
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = false,
				["vim.lsp.util.stylize_markdown"] = false,
				["cmp.entry.get_documentation"] = false,
			},
			hover = {
				enabled = true,
				silent = false, -- set to true to not show a message if hover is not available
				view = nil, -- when nil, use defaults from documentation
				---@type NoiceViewOptions
				opts = {}, -- merged with defaults from documentation
			},
		},
		health = { checker = false },
		---@type NoicePresets
		presets = {
			bottom_search = false, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
		},
		---@type NoiceRouteConfig[]
		routes = {
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
					},
				},
				view = "mini",
			},
		},
	},
}
