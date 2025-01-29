return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufWritePost", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				bash = { "shfmt" },
				xml = { "xmllint" },
			},
		})

		-- COMMANDS
		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end
			require("conform").format({
				lsp_format = "fallback",
				async = true,
				timeout_ms = 1000,
				quiet = false,
				range = range,
				stop_after_first = true,
			})
		end, { desc = "Format file", range = true })

		-- KEYMAPS
		vim.keymap.set(
			{ "n", "v" },
			"<leader>cf",
			"<cmd>Format<cr>",
			{ desc = "Format file or range (in visual mode)" }
		)
	end,
}
