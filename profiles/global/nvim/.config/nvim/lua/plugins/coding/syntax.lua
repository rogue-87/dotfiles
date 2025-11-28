return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	---@type TSConfig|fun(): TSConfig?
	config = function()
		local ts = require("nvim-treesitter")
		ts.install({
			-- required
			"c",
			"diff",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"regex",
			"vim",
			"vimdoc",
			-- other
			"bash",
			"cpp",
			"dart",
			"java",
			"json",
			"jsonc",
			"just",
			"rust",
			"toml",
			"typst",
			"yaml",
		})
	end,
}
