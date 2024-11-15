return {
	-- lsp
	-- clangd and rust-analyzer comes with a formatter
	-- but I configured rust to use rustfmt and fallback to lsp formatting
	{
		"neovim/nvim-lspconfig",
		optional = true,
		ft = { "c", "cpp", "rust" },
		opts = function()
			local lspconfig = require("lspconfig")
			-- clangd is installed by default on most linux distros and even if not, you can still install it
			-- using the package manager or mason
			-- by default it will use the one in /usr/bin/clangd-18
			lspconfig["clangd"].setup({ cmd = { "clangd-18" } })
			lspconfig["rust_analyzer"].setup({})
		end,
	},
	-- formatter
	{
		"stevearc/conform.nvim",
		optional = true,
		ft = { "rust" },
		opts = function()
			require("conform").setup({
				formatters_by_ft = {
					rust = { "rustfmt", lsp_format = "fallback" },
				},
			})
		end,
	},
	-- debugger
	{
		"mfussenegger/nvim-dap",
		optional = true,
		ft = { "c", "cpp", "rust" },
		dependencies = {
			"williamboman/mason.nvim", -- codelldb
		},
		opts = function()
			local dap = require("dap")
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = "codelldb",
					args = { "--port", "${port}" },
					-- detached = false, -- On windows you may have to uncomment this.
				},
			}

			dap.configurations.c = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}
			dap.configurations.cpp = dap.configurations.c

			dap.configurations.rust = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}
		end,
	},
}
