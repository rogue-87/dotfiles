return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		-- LINTER CONFIG
		lint.linters_by_ft = {
			-- lua = { "selene" },
			python = { "ruff" },
			rust = { "clippy" },
		}

		-- AUTO COMMANDS
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
