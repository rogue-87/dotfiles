return {
	-- lsp
	{
		"neovim/nvim-lspconfig",
		optional = true,
		ft = { "luau" },
		opts = function()
			local lspconfig = require("lspconfig")
			lspconfig["fish_lsp"].setup({})
		end,
	},
}
