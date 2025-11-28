return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	---@type LspsagaConfig
	opts = {
		lightbulb = { sign = false, virtual_text = true },
		rename = { in_select = false, keys = { quit = "<esc>" } },
		symbol_in_winbar = { enable = true },
	},
}
