-- Diagnostic icons
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Debug icons
vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
local dap_icons = {
	Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
	Breakpoint = { " ", "DiagnosticError" }, -- set to DiagnosticError to change color to red
	BreakpointCondition = { " ", "DiagnosticInfo" },
	BreakpointRejected = { " ", "DiagnosticError" },
	LogPoint = ".>",
}
for name, sign in pairs(dap_icons) do
	sign = type(sign) == "table" and sign or { sign }
	vim.fn.sign_define(
		"Dap" .. name,
		{ text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
	)
end

local M = {}
M.options = require("rogue.config.options")
M.keymaps = require("rogue.config.keymaps")
M.autocmds = require("rogue.config.autocmds")

return M
