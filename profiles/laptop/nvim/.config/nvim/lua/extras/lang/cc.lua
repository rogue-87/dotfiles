if vim.fn.filereadable("CMakeLists.txt") == 1 then
	--Enable (broadcasting) snippet capability for completion
	local capabilities = require("utils").lsp.capabilities.get()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	require("lspconfig").neocmake.setup({ capabilities = capabilities })
end

return {
	-- lsp
	{
		"neovim/nvim-lspconfig",
		optional = true,
		ft = { "c", "cpp" },
		opts = function()
			local lspconfig = require("lspconfig")
			-- clangd is installed by default on most linux distros and even if not, you can still install it
			-- using the package manager or mason
			-- by default it will use the one in /usr/bin/clangd
			lspconfig["clangd"].setup({ cmd = { "clangd" } })
		end,
	},
	-- debugger
	{
		"mfussenegger/nvim-dap",
		optional = true,
		ft = { "c", "cpp" },
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

			local dapConfig = {
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			}

			dap.configurations.c = { dapConfig }
			dap.configurations.cpp = { dapConfig }
		end,
	},
}
