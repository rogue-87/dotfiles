local utils = require("utils")

require("config.options")
utils.lazy_load({ "config.keymaps", "config.autocmds" })
