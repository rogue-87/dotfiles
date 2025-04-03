-- load vim settings(options, keymaps, etc...)
require("config")

-- bootstrap lazy.nvim
require("config.lazy")

vim.cmd("colorscheme nightfox")

vim.lsp.enable({ "luals", "bashls", "jsonls", "taplo" })
