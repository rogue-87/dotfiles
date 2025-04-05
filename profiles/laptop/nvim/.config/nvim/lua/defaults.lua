return {
	-- icons used by other plugins
	icons = {
		diagnostics = {
			Error = "󰅚 ",
			Warn = "󰀪 ",
			Hint = "󰌶 ",
			Info = " ",
		},
		debugger = {
			DapBreakpoint = " ",
			DapBreakpointCondition = " ",
			DapLogPoint = " ",
			DapStopped = " ",
			DapBreakpointRejected = " ",
		},
		git = {
			add = { text = "│" },
			change = { text = "!" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		kinds = {
			Array = " ",
			Boolean = " ",
			Class = " ",
			Color = "  ",
			Constant = " ",
			Constructor = "",
			Copilot = " ",
			Enum = " ",
			EnumMember = "",
			Event = " ",
			Field = "󰄶 ",
			File = "󰈙",
			Folder = "  ",
			Function = "󰊕",
			Interface = " ",
			Keyword = "󰌋 ",
			Method = "󰆧 ",
			Module = " ",
			Namespace = " ",
			Null = " ",
			Number = " ",
			Object = " ",
			Operator = " ",
			Package = "󰏗 ",
			Property = " ",
			Reference = " ",
			Snippet = " ",
			String = " ",
			Struct = " ",
			Text = "󰊄 ",
			TypeParameter = " ",
			Unit = " ",
			Value = "󰎠",
			Variable = "󰘛 ",
		},
	},
	-- options from nvim_open_win()| vim.diagnostic.open_float()
	-- | vim.lsp.util.open_floating_preview()| vim.diagnostic.config()
	---@type vim.diagnostic.Opts
	diagnostics_options = {
		float = {
			relative = "cursor",
			-- "single": A single line box.
			-- "double": A double line box.
			-- "rounded": Like "single", but with rounded corners "╭"
			-- "solid": Adds padding by a single whitespace cell.
			-- "shadow": A drop shadow effect by blending with the
			-- "none": No border (default).
			border = "none",
			-- vim.lsp.util.open_floating_preview()
			max_width = math.floor(vim.o.columns * 0.84),
			max_height = math.floor(vim.o.lines * 0.6),
			close_events = {
				"BufLeave",
				"CursorMoved",
				"InsertEnter",
				"FocusLost",
			},
			focusable = false,
			zindex = 3,
			focus = false,
			-- vim.diagnostic.open_float()
			source = "if_many",
			severity_sort = true,
		},
		jump = {},
		virtual_lines = false,
		virtual_text = true,
		severity_sort = true,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "󰅚 ",
				[vim.diagnostic.severity.WARN] = "󰀪 ",
				[vim.diagnostic.severity.HINT] = "󰌶 ",
				[vim.diagnostic.severity.INFO] = " ",
			},
		},
		underline = {},
		---@type vim.diagnostic.Opts.Float
		update_in_insert = {},
	},
}
