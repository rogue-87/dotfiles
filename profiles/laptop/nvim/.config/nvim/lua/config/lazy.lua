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
		{ import = "plugins.ui" },
		{ import = "plugins.editor" },
		{ import = "plugins.coding" },
		{ import = "plugins.coding.lsp" },
		{ import = "plugins.debugging" }, -- DAP support for nvim

		-- { import = "extras" }, -- extra stuff
		-- { import = "extras.ai" },
		-- { import = "extras.db" },
		-- { import = "extras.discord" },
		-- { import = "extras.godot" },
		{ import = "extras.wakatime" },
		{ import = "extras.webdev" },

		-- { import = "extras.lang" }, -- uncomment this to load all lang configs
		{ import = "extras.lang.csharp" },
		{ import = "extras.lang.cxx" },
		{ import = "extras.lang.dart" },
		{ import = "extras.lang.fish" },
		{ import = "extras.lang.golang" },
		-- { import = "extras.lang.java" },
		{ import = "extras.lang.luau" },
		{ import = "extras.lang.markdown" },
		-- { import = "extras.lang.php" },
		{ import = "extras.lang.python" },
		{ import = "extras.lang.rust" },
		-- { import = "extras.lang.zig" },
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

vim.cmd("colorscheme nightfox")
