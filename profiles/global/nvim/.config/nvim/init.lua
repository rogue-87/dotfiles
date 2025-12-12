--  utilities & helper functions
_G.utils = require("extra.utils")
-- global settings
_G.settings = { colorscheme = "nightfox" }
-- Prepend mise shims to PATH
if vim.fn.executable("mise") == 1 then
	vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH
end

-- load vim settings(options, keymaps, etc...)
require("config.options")
utils.lazy_load({
	"config.keymaps",
	"config.autocmds",
	"extra.collections.webdev",
	"extra.collections.godot",
})

-- bootstrap lazy.nvim
require("config.lazy")

-- choose colorscheme
vim.cmd("colorscheme " .. settings.colorscheme)

-- language server configs to enable
vim.lsp.enable({
	-- shell langs
	"bash-ls",
	-- programming langs
	"clangd",
	"dart-ls",
	"jdt-ls",
	"kotlin-ls",
	"emmylua-ls",
	"luau-lsp",
	"pyright",
	"rust-analyzer",
	"zls",
	-- other
	"json-ls",
	"taplo",
	"tinymist",
})
