local M = {}

M.node = {
	"mfussenegger/nvim-lint",
	optional = true,
	opts = function()
		local node = {
			javascript = { "eslint" },
			javascriptreact = { "eslint" },
			typescript = { "eslint" },
			typescriptreact = { "eslint" },
		}

		for k, _ in pairs(node) do
			table.insert(require("lint").linters_by_ft, node[k])
		end
	end,
}

M.deno = {
	"mfussenegger/nvim-lint",
	optional = true,
	opts = function()
		local deno = {
			javascript = { "deno" },
			javascriptreact = { "deno" },
			typescript = { "deno" },
			typescriptreact = { "deno" },
			json = { "deno" },
		}

		for k, _ in pairs(deno) do
			table.insert(require("lint").linters_by_ft, deno[k])
		end
	end,
}

return M
