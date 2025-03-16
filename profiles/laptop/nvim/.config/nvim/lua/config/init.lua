require("config.options")

local utils = require("config.utils")

utils.lazy_load({ "config.autocmds", "config.keymaps" })

local diagnostics_options = require("config.defaults").diagnostics_options
vim.diagnostic.config(diagnostics_options)

-- configure diagnostics signs
for name, icon in pairs(require("config.defaults").icons.diagnostics) do
	name = "DiagnosticSign" .. name
	vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end

-- configure debugger diagnostics signs
for name, icon in pairs(require("config.defaults").icons.debugger) do
	vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end
