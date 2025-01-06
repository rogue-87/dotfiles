return {
	-- lsp
	{
		"neovim/nvim-lspconfig",
		optional = true,
		ft = { "php", "blade", "html" },
		opts = function()
			local lspconfig = require("lspconfig")
			lspconfig["intelephense"].setup({})
			-- lspconfig["phpactor"].setup({})
		end,
	},
}
