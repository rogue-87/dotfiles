return {
	-- Auto close
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
	-- Close surrounding text
	{ "kylechui/nvim-surround", version = "*", event = { "BufReadPre", "BufNewFile" }, opts = {} },
	-- Commenting
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		opts = function()
			return {
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			}
		end,
	},
	-- Moving code
	{
		"fedepujol/move.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("move").setup()
			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<A-j>", ":MoveLine(1)<cr>", opts)
			vim.keymap.set("n", "<A-k>", ":MoveLine(-1)<cr>", opts)
			vim.keymap.set("v", "<A-j>", ":MoveBlock(1)<cr>", opts)
			vim.keymap.set("v", "<A-k>", ":MoveBlock(-1)<cr>", opts)
		end,
	},
	-- Code fold
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		event = "VeryLazy",
		-- stylua: ignore
		keys = {
			{ "zR", function() require("ufo").openAllFolds() end, desc = "Open all folds" },
			{ "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
		},
		opts = {
			provider_selector = function()
				return { "lsp", "indent" }
			end,
		},
		init = function()
			vim.o.foldcolumn = "0"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},
}
