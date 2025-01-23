return {
	-- lsp
	{
		"neovim/nvim-lspconfig",
		optional = true,
		ft = { "kt", "kts", "kotlin" },
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = function()
			local lspconfig = require("lspconfig")
			lspconfig["kotlin_language_server"].setup({
				filetypes = { "kt", "kts", "kotlin" },
			})
		end,
	},
}
