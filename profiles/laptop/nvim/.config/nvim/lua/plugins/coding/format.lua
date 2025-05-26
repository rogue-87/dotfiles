return {
	"stevearc/conform.nvim",
	version = "*",
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			bash = { "shfmt" },
			json = { "prettierd" },
			lua = { "stylua" },
			markdown = { "prettierd" },
			nix = { "nixfmt" },
			python = { "ruff_format", lsp_format = "fallback" },
			rust = { "rustfmt", lsp_format = "fallback" },
			xml = { "xmllint" },
			yaml = { "prettierd" },
		},
		default_format_opts = { lsp_format = "fallback" },
	},
}
