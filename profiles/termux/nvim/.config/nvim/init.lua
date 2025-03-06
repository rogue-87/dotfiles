-- enables the new experimental lua-loader for nvim that byte-compiles and caches lua files.
vim.loader.enable()

-- load vim settings(options, keymaps, etc...)
require("config")

-- bootstrap lazy.nvim
require("config.lazy")
