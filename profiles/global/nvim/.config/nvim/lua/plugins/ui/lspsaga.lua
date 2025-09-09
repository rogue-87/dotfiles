return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	---@type LspsagaConfig
	opts = {
		lightbulb = { sign = false, virtual_text = true },
		rename = { in_select = false, keys = { quit = "<esc>" } },
		symbol_in_winbar = { enable = true },
	},
}
