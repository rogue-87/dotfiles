-- NOTE: load settings
require("rogue.config")

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
		-- { "folke/neoconf.nvim", opts = {} },
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					"nvim-dap-ui",
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					-- { path = "${3rd}/love2d/library" },
				},
			},
		},
		{ import = "rogue.plugins.ui" },
		{ import = "rogue.plugins.editor" },
		{ import = "rogue.plugins.coding" },
		{ import = "rogue.plugins.coding.lsp" },
		{ import = "rogue.plugins.debugging" }, -- DAP support for nvim

		-- { import = "rogue.extras" }, -- extra stuff
		-- { import = "rogue.extras.db" },
		-- { import = "rogue.extras.godot" },
		{ import = "rogue.extras.wakatime" },
		{ import = "rogue.extras.webdev" },

		-- { import = "rogue.extras.lang" }, -- uncomment this to load all lang configs
		{ import = "rogue.extras.lang.cc" },
		{ import = "rogue.extras.lang.csharp" },
		{ import = "rogue.extras.lang.dart" },
		{ import = "rogue.extras.lang.fish" },
		{ import = "rogue.extras.lang.golang" },
		{ import = "rogue.extras.lang.java" },
		{ import = "rogue.extras.lang.kotlin" },
		{ import = "rogue.extras.lang.luau" },
		{ import = "rogue.extras.lang.markdown" },
		{ import = "rogue.extras.lang.php" },
		{ import = "rogue.extras.lang.python" },
		{ import = "rogue.extras.lang.rust" },
	},
	install = { colorscheme = { "github_dark_default" } },
	checker = { enabled = true },
	ui = {
		wrap = true,
		border = "none",
	},
	news = { lazy = true },
	performance = {
		cache = {
			enabled = false,
		},
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
