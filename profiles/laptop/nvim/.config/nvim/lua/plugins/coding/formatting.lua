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
			lua = { "stylua" },
			bash = { "shfmt" },
			xml = { "xmllint" },
		},
		default_format_opts = { lsp_format = "fallback" },
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
