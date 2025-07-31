return {
	-- Auto close
	{ "echasnovski/mini.pairs", enabled = false, version = "*", opts = {} },
	-- don't know what this plugin exactly does but it seems cool
	{ "echasnovski/mini.surround", enabled = false, version = "*", opts = {} },
	-- Moving code
	{ "echasnovski/mini.move", version = "*", opts = {} },
	-- autoclose & autorename for html tags
	{ "windwp/nvim-ts-autotag", opts = {} },
	-- Commenting
	{
		"numToStr/Comment.nvim",
		version = "*",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		opts = function()
			return { pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook() }
		end,
	},
}
