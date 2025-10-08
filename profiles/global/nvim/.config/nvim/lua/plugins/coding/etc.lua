return {
	-- Auto close
	{ "nvim-mini/mini.pairs", enabled = false, version = "*", opts = {} },
	-- don't know what this plugin exactly does but it seems cool
	{ "nvim-mini/mini.surround", enabled = false, version = "*", opts = {} },
	-- Moving code
	{ "nvim-mini/mini.move", version = "*", opts = {} },
	-- noice diffs
	{ "nvim-mini/mini.diff", version = "*", opts = {} },
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
