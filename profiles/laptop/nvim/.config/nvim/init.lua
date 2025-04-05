-- load vim settings(options, keymaps, etc...)
require("config")
-- bootstrap lazy.nvim
require("config.lazy")

vim.cmd("colorscheme nightfox")

-- language server configs to enable
vim.lsp.enable({
	-- shell langs
	"bashls",
	"fish-lsp",
	-- programming langs
	"clangd",
	"luals",
	"omnisharp",
	"pyright",
	-- other
	"jsonls",
	"taplo",
})
