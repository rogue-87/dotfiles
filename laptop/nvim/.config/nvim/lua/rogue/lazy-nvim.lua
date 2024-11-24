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
		-- { import = "rogue.plugins.extras" }, -- stuff you probably don't need
		{ import = "rogue.plugins.extras.wakatime" },
		-- NOTE: do NOT enable both c-cpp and rustacean. this could cause some issues
		{ import = "rogue.plugins.extras.lang.c-cpp" },
		-- { import = "rogue.plugins.extras.lang.csharp" },
		{ import = "rogue.plugins.extras.lang.dart" },
		-- { import = "rogue.plugins.extras.lang.golang" },
		{ import = "rogue.plugins.extras.lang.markdown" },
		{ import = "rogue.plugins.extras.lang.python" },
		-- { import = "rogue.plugins.extras.lang.rustacean" },
		{ import = "rogue.plugins.extras.lang.webdev" },
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
