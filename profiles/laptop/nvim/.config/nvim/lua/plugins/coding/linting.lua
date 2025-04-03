-- noice
return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufWritePost", "BufNewFile" },
	dependencies = { "mason.nvim" },
	config = function()
		local lint = require("lint")
		-- LINTER CONFIG
		lint.linters_by_ft = {
			lua = { "selene" },
			markdown = { "codespell" },
			text = { "codespell" },
			typst = { "codespell" },
		}

		-- AUTO COMMANDS
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
