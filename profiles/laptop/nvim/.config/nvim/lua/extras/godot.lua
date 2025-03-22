-- WARN: language server doesn't work
return {
	-- lsp
	{
		"neovim/nvim-lspconfig",
		optional = true,
		opts = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("config.utils").lsp.capabilities.get()
			lspconfig["gdscript"].setup({
				capabilities = capabilities,
			})
		end,
		init = function()
			local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"
			if not vim.loop.fs_stat(pipepath) then
				vim.fn.serverstart(pipepath)
			end
		end,
	},
	-- formatter
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = function()
			require("conform").setup({
				formatters_by_ft = {
					gd = { "gdformat", lsp = "fallback" },
				},
			})
		end,
	},
	-- linter
	{
		"mfussenegger/nvim-lint",
		optional = true,
		opts = function()
			local gd = { "gdlint" }
			table.insert(require("lint").linters_by_ft, gd)
		end,
	},
}
