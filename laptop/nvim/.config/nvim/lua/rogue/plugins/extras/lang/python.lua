return {
	-- lsp
	{
		"neovim/nvim-lspconfig",
		optional = true,
		ft = "py",
		dependencies = {
			"williamboman/mason.nvim", -- pylsp, pyright.
		},
		opts = function()
			require("lspconfig").pylsp.setup({
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								ignore = { "W391" },
								maxLineLength = 100,
							},
						},
					},
				},
			})
		end,
	},
	-- formatter
	{
		"stevearc/conform.nvim",
		optional = true,
		ft = "py",
		dependencies = {
			"williamboman/mason.nvim", -- ruff, black, isort.
		},
		opts = function()
			require("conform").setup({
				formatters_by_ft = {
					py = { "ruff", "black", "isort", lsp_format = "fallback" },
				},
			})
		end,
	},
	-- linter
	{
		"mfussenegger/nvim-lint",
		optional = true,
		ft = "py",
		dependencies = {
			"williamboman/mason.nvim", -- ruff, mypy.
		},
		opts = function()
			local python = { "ruff" }
			table.insert(require("lint").linters_by_ft, python)
		end,
	},
	-- debugger
	-- NOTE: still not working properly
	--[[ {
		"mfussenegger/nvim-dap",
		optional = true,
		ft = "py",
		dependencies = {
			"williamboman/mason.nvim", -- debugpy
		},
		opts = function()
			local dap = require("dap")
			local mason = require("mason-registry")
			local mason_python_bin = mason.get_package("debugpy"):get_install_path() .. "/venv/bin/python"

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
						command = mason_python_bin,
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
	}, ]]
}
