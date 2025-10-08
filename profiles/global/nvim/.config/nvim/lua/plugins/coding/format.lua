return {
	"stevearc/conform.nvim",
	version = "*",
	lazy = false,
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			bash = { "shfmt" },
			json = { "prettierd", "prettier" },
			lua = { "stylua" },
			luau = { "stylua" },
			markdown = { "prettierd" },
			nix = { "nixfmt" },
			python = { "ruff_format", lsp_format = "fallback" },
			rust = { "rustfmt", lsp_format = "fallback" },
			typst = { "typstyle", lsp_format = "fallback" },
			xml = { "xmllint" },
			yaml = { "prettierd" },
		},
		default_format_opts = { lsp_format = "fallback" },
	},
	keys = {
		{
			"<localleader>df",
			"<cmd>lua require('conform').format({async = true})<cr>",
			desc = "format",
			mode = { "n" },
		},
		{
			"<localleader>df",
			"<cmd>lua require('conform').format({async = true, })<cr>",
			desc = "range format",
			mode = { "v" },
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
