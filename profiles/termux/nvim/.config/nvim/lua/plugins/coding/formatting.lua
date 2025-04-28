return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufWritePre", "BufWritePost", "BufNewFile" },
	keys = {
		{
			"<localleader>f",
			function()
				require("conform").format({ async = true })
			end,
			mode = { "n", "v" },
			desc = "range format buffer",
		},
	},
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			bash = { "shfmt" },
			go = { "gofmt", lsp_format = "fallback" },
			lua = { "stylua" },
			python = { "ruff_format", lsp_format = "fallback" },
			rust = { "rustfmt", lsp_format = "fallback" },
			xml = { "xmllint" },
		},
		default_format_opts = { lsp_format = "fallback" },
	},
}
