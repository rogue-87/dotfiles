return {
	"nvim-treesitter/nvim-treesitter",
	-- lazy = false,
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"luadoc",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"diff",
				--
				"xml",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"svelte",
				"jsdoc",
			},
			modules = {},
			ignore_install = {},
			sync_install = true,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = false },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>ss",
					node_incremental = "<leader>si",
					scope_incremental = "<leader>sc",
					node_decremental = "<leader>sd",
				},
			},
		})
	end,
}
