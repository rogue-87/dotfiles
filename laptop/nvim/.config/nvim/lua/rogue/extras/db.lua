return {
	-- language server
	{
		"neovim/nvim-lspconfig",
		optional = true,
		ft = { "sql", "mysql" },
		opts = function()
			require("lspconfig").sqls.setup({})
		end,
	},
}
