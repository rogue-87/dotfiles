---@type vim.lsp.Config
return {
	root_markers = { ".git", ".obsidian", ".moxide.toml" },
	filetypes = { "markdown" },
	cmd = { "markdown-oxide" },
	on_attach = function(client, bufnr)
		vim.api.nvim_buf_create_user_command(bufnr, "OxideToday", function()
			client:exec_cmd({ title = "today", command = "jump", arguments = { "today" } })
		end, {
			desc = "Open today's daily note",
		})

		vim.api.nvim_buf_create_user_command(bufnr, "OxideTomorrow", function()
			client:exec_cmd({ title = "tomorrow", command = "jump", arguments = { "tomorrow" } })
		end, {
			desc = "Open tomorrow's daily note",
		})
		vim.api.nvim_buf_create_user_command(bufnr, "OxideYesterday", function()
			client:exec_cmd({ title = "yesterday", command = "jump", arguments = { "yesterday" } })
		end, {
			desc = "Open yesterday's daily note",
		})
	end,
}
