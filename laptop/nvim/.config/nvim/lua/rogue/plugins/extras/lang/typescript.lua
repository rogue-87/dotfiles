-- NOTE: only works for js files for now
return {
	-- debugger
	{
		"mfussenegger/nvim-dap",
		optional = true,
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = function(_, opts)
					opts.ensure_installed = opts.ensure_installed or {}
					table.insert(opts.ensure_installed, "js-debug-adapter")
				end,
			},
		},
		opts = function()
			local dap = require("dap")
			local mason_registry = require("mason-registry")

			if not dap.adapters["pwa-node"] then
				local js_debug_path = mason_registry.get_package("js-debug-adapter"):get_install_path()
				dap.adapters["pwa-node"] = {
					type = "server",
					host = "localhost",
					port = "${port}",
					executable = {
						command = "node",
						args = { js_debug_path .. "/js-debug/src/dapDebugServer.js", "${port}" },
					},
				}
			end

			if not dap.adapters["node"] then
				dap.adapters["node"] = function(cb, config)
					if config.type == "node" then
						config.type = "pwa-node"
					end
					local nativeAdapter = dap.adapters["pwa-node"]
					if type(nativeAdapter) == "function" then
						nativeAdapter(cb, config)
					else
						cb(nativeAdapter)
					end
				end
			end

			if not dap.adapters["chrome"] then
				local chrome_debug_path = mason_registry.get_package("chrome-debug-adapter"):get_install_path()
				dap.adapters.chrome = {
					type = "executable",
					command = "node",
					args = { chrome_debug_path .. "/out/src/chromeDebug.js" },
				}
			end

			local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "astro" }

			local vscode = require("dap.ext.vscode")
			vscode.type_to_filetypes["node"] = js_filetypes
			vscode.type_to_filetypes["pwa-node"] = js_filetypes

			for _, language in ipairs(js_filetypes) do
				if not dap.configurations[language] then
					dap.configurations[language] = {
						-- Debug single nodejs file
						{
							type = "pwa-node",
							request = "launch",
							name = "Launch file",
							program = "${file}",
							cwd = "${workspaceFolder}",
						},
						-- Debug nodejs processes (make sure to add --inspect when you run the process)
						{
							type = "pwa-node",
							request = "attach",
							name = "Attach",
							processId = require("dap.utils").pick_process,
							cwd = "${workspaceFolder}",
						},
						{
							name = "Chrome Debug",
							type = "chrome",
							request = "attach",
							program = "${file}",
							cwd = vim.fn.getcwd(),
							sourceMaps = true,
							protocol = "inspector",
							port = 9222,
							webRoot = "${workspaceFolder}",
						},
						{
							name = "Chrome Debug (.ts)",
							type = "chrome",
							request = "attach",
							program = "${file}",
							cwd = vim.fn.getcwd(),
							sourceMaps = true,
							protocol = "inspector",
							port = 9222,
							webRoot = "${workspaceFolder}",
						},
					}
				end
			end
		end,
	},
	-- snippets
	-- {},
}
