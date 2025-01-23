return {
	"lewis6991/satellite.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		current_only = false,
		winblend = 50,
		zindex = 40,
		excluded_filetypes = {
			"neo-tree",
			"dapui_watches",
			"dapui_stacks",
			"dapui_breakpoints",
			"dapui_scopes",
			"dapui_console",
			"dap-repl",
		},
		width = 1,
		handlers = {
			cursor = {
				enable = true,
				overlap = true,
				symbols = { "⎺", "⎻", "⎼", "⎽" },
			},
			search = {
				enable = true,
			},
			diagnostic = {
				enable = true,
				signs = { "-", "=", "≡" },
				min_severity = vim.diagnostic.severity.HINT,
			},
			gitsigns = {
				enable = false,
				signs = { -- can only be a single character (multibyte is okay)
					add = "│",
					change = "│",
					delete = "-",
				},
			},
			marks = {
				enable = true,
				show_builtins = false,
				key = "m",
			},
			quickfix = {
				signs = { "-", "=", "≡" },
			},
		},
	},
}
