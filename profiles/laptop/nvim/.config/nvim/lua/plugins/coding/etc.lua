return {
	-- Auto close
	{ "windwp/nvim-autopairs", enabled = false, event = "InsertEnter", opts = {} },
	-- Close surrounding text
	{ "kylechui/nvim-surround", version = "^3.0.0", event = "VeryLazy", opts = {} },
	-- autoclose & autorename for html tags
	{ "windwp/nvim-ts-autotag", opts = {} },
	-- Commenting
	{
		"numToStr/Comment.nvim",
		dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			return { pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook() }
		end,
	},
	-- Moving code
	{
		"fedepujol/move.nvim",
		lazy = false,
		keys = {
			-- Normal Mode
			{ "<A-j>", ":MoveLine(1)<CR>", desc = "Move Line Up", silent = true },
			{ "<A-k>", ":MoveLine(-1)<CR>", desc = "Move Line Down", silent = true },
			{ "<A-h>", ":MoveHChar(-1)<CR>", desc = "Move Character Left", silent = true },
			{ "<A-l>", ":MoveHChar(1)<CR>", desc = "Move Character Right", silent = true },
			-- Visual Mode
			{ "<A-j>", ":MoveBlock(1)<CR>", mode = { "v" }, desc = "Move Block Up", silent = true },
			{ "<A-k>", ":MoveBlock(-1)<CR>", mode = { "v" }, desc = "Move Block Down", silent = true },
			{ "<A-h>", ":MoveHBlock(-1)<CR>", mode = { "v" }, desc = "Move Block Left", silent = true },
			{ "<A-l>", ":MoveHBlock(1)<CR>", mode = { "v" }, desc = "Move Block Right", silent = true },
		},
		opts = {},
	},
}
