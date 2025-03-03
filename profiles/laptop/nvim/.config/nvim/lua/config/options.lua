local opt, g = vim.opt, vim.g

-- Global vim variables
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.editorconfig = true
g.mapleader = " "
g.maplocalleader = "\\"

-- use fish if available; otherwise, fallback to bash.
local shell = "fish"
local fallback_shell = "bash"
opt.shell = vim.fn.exepath(shell) ~= "" and vim.fn.exepath(shell) or vim.fn.exepath(fallback_shell)

opt.number = true
opt.relativenumber = true
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
opt.showtabline = 2
opt.incsearch = true
opt.signcolumn = "yes"
opt.scrolloff = 5
opt.termguicolors = true
opt.clipboard = "unnamedplus"
opt.autowrite = true
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 0 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true --  Confirm to save changes before exiting modified buffer
opt.smoothscroll = true
opt.cursorline = false

opt.sessionoptions = { "curdir", "folds", "globals", "help", "tabpages", "terminal", "winsize" }
opt.fillchars = { foldopen = "", foldclose = "", fold = " ", foldsep = " ", diff = "╱", eob = " " }

if vim.g.neovide then
	vim.o.guifont = "NotoMono Nerd Font:h12"
	vim.opt.linespace = 0

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
