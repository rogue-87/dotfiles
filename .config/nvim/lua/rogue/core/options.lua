--[[ Disable netrw ]]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd("let g:netrw_liststyle = 3")

vim.opt.number = true
vim.opt.relativenumber = true

--# Tab & Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
-- damn you javascript!
vim.cmd("filetype plugin indent on")

vim.opt.showtabline = 2

--# End of Tab & Indentation

-- Search
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.opt.clipboard:append("unnamedplus")

vim.opt.scrolloff = 5

vim.opt.fillchars = "eob: "
vim.opt.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"

vim.wo.foldcolumn = "0"

vim.o.shell = "/usr/bin/fish"

vim.cmd("let g:loaded_perl_provider = 0")
