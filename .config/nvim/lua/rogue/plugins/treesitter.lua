return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"regex",
				"query",

				"html",
				"css",
				"javascript",
				"scss",
				"astro",
				"vue",
				"markdown",
				"json",

				"python",
				"bash",
				"go",

				-- in order for some plugins to work properly
				"jsonc",
				"markdown_inline",
			},
			modules = {},
			ignore_install = {},
			sync_install = true,
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = { enable = true },
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
