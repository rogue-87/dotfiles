-- NOTE: bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		-- essential plugins
		{ import = "plugins.ui" }, -- colorschemes, improved lsp UI and more
		{ import = "plugins.editor" }, -- fuzzy finder, filetree, scrollbar, git integration & more
		{ import = "plugins.coding" }, -- code completion, formatting, linting, etc...
		-- other (removable plugins)
		{ import = "plugins.debug", enabled = false }, -- DAP support for nvim
		{ import = "plugins.discord", enabled = true }, -- flex on discord
		{ import = "plugins.roslyn", enabled = false }, -- C# language support(can't bother setting that stuff up)
		{ import = "plugins.wakatime", enabled = true }, -- track usage
		{ import = "plugins.markdown", enabled = true }, -- view markdown files in neovim
		-- extra configs and plugin overrides
		{ import = "extras.webdev" },
	},
	install = { colorscheme = { "nightfox" } },
	checker = { enabled = false },
	ui = { wrap = true, border = "none" },
	news = { lazy = true },
	performance = {
		cache = { enabled = true },
		reset_packpath = true,
		rtp = {
			reset = true,
			paths = {},
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
