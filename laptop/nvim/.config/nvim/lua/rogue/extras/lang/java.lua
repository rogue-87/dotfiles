return {
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
}
