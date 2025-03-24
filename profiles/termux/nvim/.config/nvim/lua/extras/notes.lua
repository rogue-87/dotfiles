return {
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		opts = {
			html = { enable = true },
			markdown = { enable = false },
			markdown_inline = { enable = false },
			typst = { enable = false },
			yaml = { enable = true },
		},
	},
	{
		"neovim/nvim-lspconfig",
		optional = true,
		ft = { "markdown", "typst" },
		opts = function()
			local lspconfig = require("lspconfig")

			lspconfig["marksman"].setup({})
			lspconfig["tinymist"].setup({})
		end,
	},
}
