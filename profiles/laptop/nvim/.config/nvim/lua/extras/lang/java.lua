return {
	-- lsp
	{
		"neovim/nvim-lspconfig",
		optional = true,
		ft = "java",
		opts = function()
			local lspconfig = require("lspconfig")
			lspconfig["jdtls"].setup({})
		end,
	},
}
