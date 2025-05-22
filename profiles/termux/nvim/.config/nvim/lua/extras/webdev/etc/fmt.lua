local M = {}

M.node = {
	"stevearc/conform.nvim",
	optional = true,
	opts = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },

				html = { "prettierd" },
				css = { "prettierd" },
			},
		})
	end,
}

M.deno = {
	"stevearc/conform.nvim",
	optional = true,
	opts = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "deno_fmt" },
				javascriptreact = { "deno_fmt" },
				typescript = { "deno_fmt" },
				typescriptreact = { "deno_fmt" },

				html = { "deno_fmt" },
				markdown = { "deno_fmt" },
				css = { "deno_fmt" },
				scss = { "deno_fmt" },

				json = { "deno_fmt" },
				yaml = { "deno_fmt" },
			},
		})
	end,
}

return M
