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
