-- autocommands go here
local utils = require("config.utils")
local autocmd = vim.api.nvim_create_autocmd
local map = utils.augroup
local augroup = utils.augroup

-- resize splits if window got resized
autocmd({ "VimResized" }, {
	group = augroup("resize_splits"),
	callback = function()
		vim.cmd("wincmd =")
		vim.cmd("tabdo wincmd =")
	end,
})

local diagnostics_options = require("config.defaults").diagnostics_options
-- automatically show diagnostics on current line
autocmd({ "CursorHold", "CursorHoldI" }, {
	callback = function()
		vim.diagnostic.open_float(nil, diagnostics_options.float)
	end,
})
