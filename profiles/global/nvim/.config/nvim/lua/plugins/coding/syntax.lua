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
			"diff",
			"luadoc",
			"regex",
			"c",
			"lua",
			"markdown",
			"markdown_inline",
			"query",
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
			"luau",
			"nix",
			"prisma",
			"rust",
			"toml",
			"typst",
			"yaml",
		})
	end,
}
