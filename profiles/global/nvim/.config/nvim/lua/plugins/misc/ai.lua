---@type LazySpec
return {
	{
		"NickvanDyke/opencode.nvim",
		lazy = false,
		config = function()
			---@type opencode.Opts
			vim.g.opencode_opts = {}

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
		"monkoose/neocodeium",
		enabled = false,
		lazy = false,
		-- stylua: ignore
		keys = {
			{ "<A-f>", mode = { "i" }, function() require("neocodeium").accept() end },
			{ "<A-w>", mode = { "i" }, function() require("neocodeium").accept_word() end },
			{ "<A-a>", mode = { "i" }, function() require("neocodeium").accept_line() end },
			{ "<A-e>", mode = { "i" }, function() require("neocodeium").cycle_or_complete() end },
			{ "<A-c>", mode = { "i" }, function() require("neocodeium").clear() end },
			{ "<A-r>", mode = { "i" }, function() require("neocodeium").cycle_or_complete(-1) end },
		},
		opts = {
			enabled = false,
			filter = function(bufnr)
				if vim.endswith(vim.api.nvim_buf_get_name(bufnr), ".env") then
					return false
				end
				return true
			end,
		},
	},
}
