return {
	"mfussenegger/nvim-lint",
	dependencies = { "mason.nvim" },
	event = { "BufReadPre", "BufWritePost", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- LINTER CONFIG
		lint.linters_by_ft = {
			-- lua = { "selene" },
			markdown = { "codespell" },
		}

		-- COMMANDS
		vim.api.nvim_create_user_command("Lint", function()
			lint.try_lint()
		end, { desc = "Start Linter" })

		-- AUTO COMMANDS
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
			group = lint_augroup,
			command = "Lint",
		})
	end,
}
