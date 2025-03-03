return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local tsconfigs = require("nvim-treesitter.configs")
		tsconfigs.setup({
			ensure_installed = {
				"c",
				"lua",
				"luadoc",
				"vim",
				"vimdoc",
				"regex",
				"query",
				"markdown",
				"markdown_inline",
				"diff",
				"html",
				"css",
				"javascript",
			},
			modules = {},
			ignore_install = {},
			sync_install = true,
			auto_install = false,
			highlight = { enable = true },
			indent = { enable = false },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>ts",
					node_incremental = "<c-a>",
					node_decremental = "<c-x>",
					scope_incremental = "<c-s>",
				},
			},
		})

		local ts_parsers = require("nvim-treesitter.parsers")

		-- to keep track notified filetypes
		local notified_filetypes = {}

		-- to check if a treesitter parser isn't installed for whatever filetype
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				local ft = vim.bo.filetype
				if ft == "" or notified_filetypes[ft] then
					return
				end

				if ts_parsers.get_parser_configs()[ft] and not ts_parsers.has_parser(ft) then
					vim.notify("Tree-sitter parser is not installed for filetype: " .. ft, vim.log.levels.WARN)
					notified_filetypes[ft] = true
				end
			end,
		})
	end,
}
