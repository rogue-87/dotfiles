return {
	-- lsp
	{
		"neovim/nvim-lspconfig",
		optional = true,
		opts = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("config.utils").lsp.capabilities.get()
			-- primary
			lspconfig["html"].setup({ capabilities = capabilities })
			-- lspconfig["emmet_ls"].setup({})

			lspconfig["cssls"].setup({ capabilities = capabilities })
			lspconfig["css_variables"].setup({
				filetypes = { "css", "scss", "less", "svelte" },
				settings = {
					lookupFiles = {
						"**/*.less",
						"**/*.scss",
						"**/*.sass",
						"**/*.css",

						-- svelte
						"src/lib/style/abstracts/colorscheme.css",
						"src/lib/style/abstracts/variables.css",
					},
				},
			})
			lspconfig["tailwindcss"].setup({})
			lspconfig["ts_ls"].setup({})
			lspconfig["eslint"].setup({
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
			})

			-- others
			lspconfig["astro"].setup({})
			lspconfig["svelte"].setup({})
		end,
	},
	-- formatter
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },

					html = { "prettier" },
					markdown = { "prettier" },

					css = { "prettier" },
					scss = { "prettier" },

					json = { "prettier" },
					yaml = { "prettier" },
				},
			})
		end,
	},
	-- debugger
	{
		"mfussenegger/nvim-dap",
		optional = true,
		dependencies = { "williamboman/mason.nvim" },
		opts = function()
			local dap = require("dap")
			local mason = require("mason-registry")

			-- debug adapter for nodejs(js) and deno(ts)
			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = {
						mason.get_package("js-debug-adapter"):get_install_path() .. "/js-debug/src/dapDebugServer.js",
						"${port}",
					},
				},
			}

			-- vscode-js-debug
			require("dap").configurations.javascript = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Debug with js-debug",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
			}

			-- js-deno
			dap.configurations.typescript = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Debug with deno",
					runtimeExecutable = "deno",
					runtimeArgs = {
						"run",
						"--inspect-wait",
						"--allow-all",
					},
					program = "${file}",
					cwd = "${workspaceFolder}",
					attachSimplePort = 9229,
				},
			}
		end,
	},
}
