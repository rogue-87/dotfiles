return {
	-- language server
	-- can also format sql files
	{
		"neovim/nvim-lspconfig",
		optional = true,
		ft = { "sql", "mysql" },
		opts = function()
			require("lspconfig").sqls.setup({})
		end,
	},
}
