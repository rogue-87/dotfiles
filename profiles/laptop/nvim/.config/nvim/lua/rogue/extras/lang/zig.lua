return {
	-- lsp
	{
		"neovim/nvim-lspconfig",
		optional = true,
		ft = { "zig", "zir" },
		opts = function()
			local lspconfig = require("lspconfig")
			lspconfig["zls"].setup({})
		end,
	},
}
