local defaults = require("config.defaults")

-- Global vim variables
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.editorconfig = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- use fish if available; otherwise, fallback to bash.
local shell = "fish"
local fallback_shell = "bash"
vim.o.shell = vim.fn.exepath(shell) ~= "" and vim.fn.exepath(shell) or vim.fn.exepath(fallback_shell)

vim.o.number = true
vim.o.relativenumber = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false
vim.o.showtabline = 2
vim.o.incsearch = true
vim.o.signcolumn = "yes"
vim.o.scrolloff = 5
vim.o.termguicolors = true
vim.o.clipboard = "unnamedplus"
vim.o.autowrite = true
vim.o.completeopt = "menu,menuone,noselect"
vim.o.conceallevel = 0 -- Hide * markup for bold and italic, but not markers with substitutions
vim.o.confirm = true --  Confirm to save changes before exiting modified buffer
vim.o.smoothscroll = true
vim.o.cursorline = false
vim.o.updatetime = 1500

vim.o.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"
vim.o.fillchars = "foldopen:,foldclose:,fold: ,foldsep: ,diff:╱,eob: "

if vim.g.neovide then
	vim.o.guifont = "NotoMono Nerd Font:h12"
	vim.o.linespace = 0

	vim.g.neovide_scale_factor = 1.0
	vim.g.neovide_text_gamma = 0.0
	vim.g.neovide_text_contrast = 0.5

	vim.g.neovide_padding_top = 0
	vim.g.neovide_padding_bottom = 0
	vim.g.neovide_padding_right = 0
	vim.g.neovide_padding_left = 0

	vim.g.neovide_floating_shadow = true
	vim.g.neovide_floating_z_height = 10
	vim.g.neovide_light_angle_degrees = 45
	vim.g.neovide_light_radius = 5

	vim.g.neovide_transparency = 1.0
	vim.g.neovide_position_animation_length = 0.15
	vim.g.neovide_scroll_animation_length = 0.3
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_theme = "auto"

	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_refresh_rate_idle = 5
	vim.g.neovide_fullscreen = false
end
vim.diagnostic.config(defaults.diagnostics_options)

-- configure diagnostics signs
for name, icon in pairs(defaults.icons.diagnostics) do
	name = "DiagnosticSign" .. name
	vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end

-- configure debugger diagnostics signs
for name, icon in pairs(defaults.icons.debugger) do
	vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end
