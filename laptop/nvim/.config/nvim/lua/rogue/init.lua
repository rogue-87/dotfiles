-- NOTE: load settings
require("rogue.config")

-- NOTE: load lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	install = { colorscheme = { "github_dark_default" } },
	checker = { enabled = true },
	spec = {
		{
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					runtime = vim.env.VIMRUNTIME,
					library = {
						"luvit-meta/library",
						"${3rd}/love2d/library",
					},
					integrations = {
						lspconfig = true,
						cmp = true,
					},
					enabled = function(root_dir)
						return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
					end,
				},
			},
			{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
		},
		{ import = "rogue.plugins" },
		{ import = "rogue.plugins.ui" },
		{ import = "rogue.plugins.editor" },
		{ import = "rogue.plugins.coding" },
		{ import = "rogue.plugins.coding.lsp" },
		{ import = "rogue.plugins.coding.debugging" }, -- debugging support(adds DAP support in nvim)
		{ import = "rogue.plugins.coding.testing" }, -- for testing frameworks(e.g. vite and such. still not 100% done)

		-- { import = "rogue.extras" }, -- extra stuff
		-- { import = "rogue.extras.godot" },
		-- { import = "rogue.extras.db" },
		{ import = "rogue.extras.wakatime" },
		{ import = "rogue.extras.webdev" },

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
		{ import = "rogue.extras.lang.rustacean" },
	},
	ui = {
		wrap = true,
		border = "none",
	},
	news = {
		lazy = true,
	},
	performance = {
		cache = {
			enabled = true,
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
