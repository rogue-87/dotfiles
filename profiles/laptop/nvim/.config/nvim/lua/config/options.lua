local defaults = require("defaults")
local utils = require("utils")

-- Global vim variables
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.editorconfig = true

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
vim.o.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"

-- enable spelling
vim.o.spell = false
vim.o.spelllang = "en_us"

-- nice and simple folding:
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldtext = ""
vim.o.foldcolumn = "0"
vim.o.fillchars = "foldopen:,foldclose:,fold: ,foldsep: ,diff:╱,eob: "
vim.o.foldmethod = "expr"
-- default to treesitter folding
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- diagnostic options
vim.diagnostic.config(defaults.diagnostics_options)

-- signs
-- configure debugger diagnostics signs
for name, icon in pairs(defaults.icons.debugger) do
	vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end
