return {
	-- lsp
	{
		"neovim/nvim-lspconfig",
		optional = true,
		ft = "luau",
		opts = function()
			local lspconfig = require("lspconfig")
			lspconfig["luau_lsp"].setup({})
		end,
	},
	-- formatter
	{
		"stevearc/conform.nvim",
		optional = true,
		ft = "luau",
		opts = function()
			require("conform").setup({
				formatters_by_ft = {
					luau = { "stylua", lsp_format = "fallback" },
				},
			})
		end,
	},
	-- linter
	{
		"mfussenegger/nvim-lint",
		optional = true,
		ft = "luau",
		opts = function()
			local luau = { "selene" }
			table.insert(require("lint").linters_by_ft, luau)
		end,
	},
}
