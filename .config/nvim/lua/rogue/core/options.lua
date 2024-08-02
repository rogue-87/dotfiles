vim.opt.number = true
vim.opt.relativenumber = true

--# Tab & Indentation
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.softtabstop = 2

vim.o.autoindent = true
vim.o.smartindent = true
-- damn you javascript!
vim.cmd("filetype plugin indent on")


--# End of Tab & Indentation

-- Search
vim.o.showtabline = 2
vim.o.incsearch = true

vim.o.termguicolors = true
vim.o.signcolumn = "yes"

vim.opt.clipboard:append("unnamedplus")

vim.o.scrolloff = 5

vim.o.fillchars = "eob: "
vim.o.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"

vim.wo.foldcolumn = "0"

vim.o.shell = "/usr/bin/fish"
