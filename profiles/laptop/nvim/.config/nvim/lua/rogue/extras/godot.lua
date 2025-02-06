return {
	-- lsp
	{
		"neovim/nvim-lspconfig",
		optional = true,
		config = function()
			local capabilities = require("rogue.util.capabilities").get()
			local lspconfig = require("lspconfig")

			lspconfig["gdscript"].setup({
				capabilities = capabilities,
			})

			local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"
			if not vim.loop.fs_stat(pipepath) then
				vim.fn.serverstart(pipepath)
			end
		end,
	},
}
