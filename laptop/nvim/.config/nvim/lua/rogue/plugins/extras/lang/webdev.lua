-- NOTE: only works for js files for now
return {
	-- lsp
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
		},
		optional = true,
		opts = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- primary
			lspconfig["html"].setup({ capabilities = capabilities })
			lspconfig["emmet_ls"].setup({})
			lspconfig["cssls"].setup({ capabilities = capabilities })
			lspconfig["css_variables"].setup({})
			lspconfig["ts_ls"].setup({})
			lspconfig["jsonls"].setup({
				filetypes = { "json", "jsonc" },
				capabilities = capabilities,
				settings = {
					json = {
						-- Schemas https://www.schemastore.org
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})
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
		dependencies = {
			"williamboman/mason.nvim",
		},
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

			-- PER-FORMATTER CONFIG
			--[[ conform.formatters.prettier = {
				args = function(self, ctx)
					if vim.endswith(ctx.filename, ".astro") then
						return { "--stdin-filepath", "$FILENAME", "--plugin", "prettier-plugin-astro" }
					end
					return { "--stdin-filepath", "$FILENAME" }
				end,
			} ]]

			--[[ conform.formatters.prettier = {
				args = function(self, ctx)
					if vim.endswith(ctx.filename, ".svelte") then
						return { "--stdin-filepath", "$FILENAME", "--plugin", "prettier-plugin-svelte" }
					end
					return { "--stdin-filepath", "$FILENAME" }
				end,
			} ]]
		end,
	},
	-- debugger
	{
		"mfussenegger/nvim-dap",
		optional = true,
		dependencies = {
			"williamboman/mason.nvim",
		},
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

			-- js-debug
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

			-- js-firefox
			--[[ dap.adapters.firefox = {
				type = "executable",
				command = "node",
				args = {
					mason.get_package("firefox-debug-adapter"):get_install_path() .. "/dist/adapter.bundle.js",
				},
			}

			dap.configurations.typescript = {
				{
					name = "Debug with Firefox",
					type = "firefox",
					request = "launch",
					reAttach = true,
					url = "http://localhost:3000",
					webRoot = "${workspaceFolder}",
					firefoxExecutable = "/usr/bin/firefox",
				},
			} ]]
		end,
	},
}
