return {
	"mfussenegger/nvim-lint",
	dependencies = { "mason.nvim" },
	event = { "BufReadPre", "BufWritePost", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- LINTER CONFIG
		lint.linters_by_ft = {
			lua = { "selene" },
			markdown = { "codespell" },
		}

		-- AUTO COMMANDS
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
