return {
	-- lsp
	{
		"neovim/nvim-lspconfig",
		optional = true,
		ft = { "teal", "tl" },
		opts = function()
			local lspconfig = require("lspconfig")
			lspconfig["teal_ls"].setup({})
		end,
	},
}
