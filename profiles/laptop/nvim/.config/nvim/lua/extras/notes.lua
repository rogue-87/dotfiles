return {
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		opts = {
			html = { enable = false },
			markdown = { enable = false },
			markdown_inline = { enable = true },
			typst = { enable = false },
			yaml = { enable = false },
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
