return {
	-- fallback
	-- lsp
	{
		"neovim/nvim-lspconfig",
		optional = true,
		ft = "java",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = function()
			local lspconfig = require("lspconfig")
			lspconfig["jdtls"].setup({})
		end,
	},
	-- formatter
	{
		"stevearc/conform.nvim",
		optional = true,
		dependencies = {
			"williamboman/mason.nvim", -- xmlformatter
		},
		opts = function()
			if vim.fn.filereadable("pom.xml") == 1 then
				require("conform").setup({
					formatters_by_ft = {
						xml = { "xmlformat" },
					},
				})
			end
		end,
	},
}
