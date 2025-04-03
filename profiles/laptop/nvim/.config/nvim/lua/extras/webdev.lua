return {
	-- lsp
	{
		"neovim/nvim-lspconfig",
		optional = true,
		opts = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("utils").lsp.capabilities.get()

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

			if vim.fn.filereadable("package.json") == 1 then
				lspconfig["ts_ls"].setup({})
				lspconfig["eslint"].setup({
					on_attach = function(client, bufnr)
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = bufnr,
							command = "EslintFixAll",
						})
					end,
				})
			elseif vim.fn.filereadable("deno.json") == 1 then
				lspconfig["denols"].setup({})
			end

			if vim.fn.filereadable("package.json") == 1 or vim.fn.filereadable("deno.json") == 1 then
				lspconfig["svelte"].setup({})
				lspconfig["tailwindcss"].setup({})
			end
		end,
	},
	-- formatter
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = function()
			local conform = require("conform")
			if vim.fn.filereadable("package.json") == 1 then
				conform.setup({
					formatters_by_ft = {
						javascript = { "prettier" },
						javascriptreact = { "prettier" },
						typescript = { "prettier" },
						typescriptreact = { "prettier" },

						html = { "prettier" },
						markdown = { "prettier" },
						css = { "prettier" },
						scss = { "prettier" },

						json = { "prettier" },
						yaml = { "prettier" },
					},
				})
			elseif vim.fn.filereadable("deno.json") == 1 then
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
			end
		end,
	},
	-- linter
	{
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

			for k, v in pairs(deno) do
				table.insert(require("lint").linters_by_ft, deno[k])
			end
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

			-- debug adapter for nodejs & deno
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

			dap.configurations.javascript = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Debug with js-debug",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
			}

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
