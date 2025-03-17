-- enables the new experimental lua-loader for nvim that byte-compiles and caches lua files.
vim.loader.enable()

-- load vim settings(options, keymaps, etc...)
require("config")

-- bootstrap lazy.nvim
require("config.lazy")

if vim.fn.executable("mise") == 1 then
	-- Prepend mise shims to PATH
	vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH
end
