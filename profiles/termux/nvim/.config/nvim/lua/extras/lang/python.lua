return {
	-- lsp
	{
		"neovim/nvim-lspconfig",
		optional = true,
		ft = "py",
		opts = function()
			require("lspconfig")["pylyzer"].setup({})
		end,
	},
	-- formatter
	{
		"stevearc/conform.nvim",
		optional = true,
		ft = "py",
		opts = function()
			require("conform").setup({
				formatters_by_ft = {
					python = {
						"ruff_format",
						-- "black",
						-- "isort",
						lsp_format = "fallback",
					},
				},
			})
		end,
	},
	-- linter
	{
		"mfussenegger/nvim-lint",
		optional = true,
		ft = "py",
		opts = function()
			local python = { "ruff" }
			table.insert(require("lint").linters_by_ft, python)
		end,
	},
	-- debugger
	{
		"mfussenegger/nvim-dap",
		optional = true,
		ft = "py",
		opts = function()
			local dap = require("dap")

			dap.adapters.python = function(cb, config)
				if config.request == "attach" then
					---@diagnostic disable-next-line: undefined-field
					local port = (config.connect or config).port
					---@diagnostic disable-next-line: undefined-field
					local host = (config.connect or config).host or "127.0.0.1"
					cb({
						type = "server",
						port = assert(port, "`connect.port` is required for a python `attach` configuration"),
						host = host,
						options = {
							source_filetype = "python",
						},
					})
				else
					cb({
						type = "executable",
						command = os.getenv("VIRTUAL_ENV") .. "/bin/python",
						args = { "-m", "debugpy.adapter" },
						options = {
							source_filetype = "python",
						},
					})
				end
			end
			dap.configurations.python = {
				{
					-- The first three options are required by nvim-dap
					type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
					request = "launch",
					name = "Launch file",
					-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
					program = "${file}", -- This configuration will launch the current file if used.
					pythonPath = function()
						-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
						-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
						-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
						local cwd = vim.fn.getcwd()
						if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
							return cwd .. "/venv/bin/python"
						elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
							return cwd .. "/.venv/bin/python"
						elseif vim.fn.executable(cwd .. "/bin/python") == 1 then
							return cwd .. "/bin/python"
						else
							return "/usr/bin/python"
						end
					end,
				},
			}
		end,
	},
}
