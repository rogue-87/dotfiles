return {
	-- lsp
	{
		"neovim/nvim-lspconfig",
		optional = true,
		ft = { "go", "gomod", "gowork", "gotmpl" },
		opts = function()
			local lspconfig = require("lspconfig")
			lspconfig["gopls"].setup({})
		end,
	},
	-- formatter
	{
		"stevearc/conform.nvim",
		optional = true,
		ft = { "go", "gomod", "gowork", "gotmpl" },
		opts = function()
			require("conform").setup({
				formatters_by_ft = {
					go = { "gofmt", lsp_format = "fallback" },
				},
			})
		end,
	},
	-- linter
	{
		"mfussenegger/nvim-lint",
		optional = true,
		ft = { "go", "gomod", "gowork", "gotmpl" },
		opts = function()
			local go = { "golint" }
			table.insert(require("lint").linters_by_ft, go)
		end,
	},
	-- debugger
	{
		"mfussenegger/nvim-dap",
		optional = true,
		ft = { "go", "gomod", "gowork", "gotmpl" },
		opts = function()
			local dap = require("dap")
			dap.adapters.delve = function(callback, config)
				---@diagnostic disable-next-line: undefined-field
				if config.mode == "remote" and config.request == "attach" then
					callback({
						type = "server",
						---@diagnostic disable-next-line: undefined-field
						host = config.host or "127.0.0.1",
						---@diagnostic disable-next-line: undefined-field
						port = config.port or "38697",
					})
				else
					callback({
						type = "server",
						port = "${port}",
						executable = {
							command = "dlv",
							args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
							detached = vim.fn.has("win32") == 0,
						},
					})
				end
			end

			-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
			dap.configurations.go = {
				{
					type = "delve",
					name = "Debug",
					request = "launch",
					program = "${file}",
				},
				{
					type = "delve",
					name = "Debug test", -- configuration for debugging test files
					request = "launch",
					mode = "test",
					program = "${file}",
				},
				-- works with go.mod packages and sub packages
				{
					type = "delve",
					name = "Debug test (go.mod)",
					request = "launch",
					mode = "test",
					program = "./${relativeFileDirname}",
				},
			}
		end,
	},
}
