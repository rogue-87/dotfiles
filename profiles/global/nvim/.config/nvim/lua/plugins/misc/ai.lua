---@type LazySpec
return {
	{
		"NickvanDyke/opencode.nvim",
		lazy = false,
		dependencies = {
			-- Recommended for better prompt input, and required to use opencode.nvim's embedded terminal — otherwise optional
			{ "folke/snacks.nvim", opts = { input = { enabled = true } } },
		},
		config = function()
			---@type opencode.Opts
			vim.g.opencode_opts = {
				provider = {
					enabled = "snacks",
					snacks = {},
				},
			}

			-- Required for `opts.auto_reload`.
			vim.o.autoread = true
		end,
		keys = {
			{ "<leader>o", "", desc = "Opencode" },
			{
				"<leader>oa",
				function()
					require("opencode").ask("@this: ", { submit = true })
				end,
				desc = "Ask opencode",
				mode = { "n", "x" },
			},
			{
				"<leader>oe",
				function()
					require("opencode").select()
				end,
				desc = "Execute opencode action…",
				mode = { "n", "x" },
			},
			{
				"<leader>op",
				function()
					require("opencode").prompt("@this")
				end,
				desc = "Add to opencode",
				mode = { "n", "x" },
			},
			{
				"<leader>ot",
				function()
					require("opencode").toggle()
				end,
				desc = "Toggle opencode",
				mode = {
					"n", --[[ "t" ]]
				},
			},
			{
				"<leader>osu",
				function()
					require("opencode").command("session.half.page.up")
				end,
				desc = "opencode half page up",
				mode = "n",
			},
			{
				"<leader>osd",
				function()
					require("opencode").command("session.half.page.down")
				end,
				desc = "opencode half page down",
				mode = "n",
			},
		},
	},
	{
		"Exafunction/windsurf.nvim",
		enabled = false,
		dependencies = { "nvim-lua/plenary.nvim", "saghen/blink.cmp" },
		opts = {},
	},
}
