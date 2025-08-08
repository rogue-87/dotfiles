-- global vim variables
vim.g.editorconfig = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- use fish if available; otherwise, fallback to bash.
local shell = "fish"
local fallback_shell = "bash"
vim.o.shell = vim.fn.exepath(shell) ~= "" and vim.fn.exepath(shell) or vim.fn.exepath(fallback_shell)

vim.o.autoindent = true
vim.o.autowrite = true
vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menu,menuone,noselect"
vim.o.conceallevel = 0
vim.o.confirm = true
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.o.expandtab = false
vim.o.incsearch = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 5
vim.o.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"
vim.o.shiftwidth = 4
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.signcolumn = "yes"
vim.o.smartindent = false
vim.o.smoothscroll = false
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.wrap = false

-- spelling
vim.o.spell = false
vim.o.spelllang = "en_us"

-- nice and simple folding:
vim.o.fillchars = "foldopen:,foldclose:,fold: ,foldsep: ,diff:╱,eob: "
vim.o.foldcolumn = "0"
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldtext = ""
-- default to treesitter folding
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.o.list = true
vim.o.listchars = "tab: ->,space:."

local signs = utils.icons.diagnostics
-- diagnostic options
vim.diagnostic.config({
	float = {
		border = "single",
		severity_sort = true,
		source = "if_many",
		zindex = 3,
	},
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = signs.error,
			[vim.diagnostic.severity.HINT] = signs.hint,
			[vim.diagnostic.severity.INFO] = signs.info,
			[vim.diagnostic.severity.WARN] = signs.warn,
		},
	},
	virtual_lines = false,
	virtual_text = true,
})
