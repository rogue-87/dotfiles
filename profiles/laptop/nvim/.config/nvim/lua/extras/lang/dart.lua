return {
	-- lsp
	{
		"neovim/nvim-lspconfig",
		optional = true,
		ft = "dart",
		opts = function()
			local lspconfig = require("lspconfig")
			lspconfig["dartls"].setup({})
		end,
	},
	-- debugger
	-- WARN: doesn't work
	{
		"mfussenegger/nvim-dap",
		optional = true,
		ft = "dart",
		dependencies = {},
		opts = function()
			local dartSdk = vim.fn.glob(vim.fn.expand("~/.local/share/mise/installs/flutter/*-stable/bin/cache/dart-sdk/bin/dart"))
			local flutterSdk = vim.fn.glob(vim.fn.expand("~/.local/share/mise/installs/flutter/*-stable/bin/flutter"))
			local dap = require("dap")

			dap.configurations.dart = {
				{
					type = "dart",
					request = "launch",
					name = "Launch dart",
					dartSdkPath = dartSdk,
					flutterSdkPath = flutterSdk,
					program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
					cwd = "${workspaceFolder}",
				},
				{
					type = "flutter",
					request = "launch",
					name = "Launch flutter",
					dartSdkPath = dartSdk,
					flutterSdkPath = flutterSdk,
					program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
					cwd = "${workspaceFolder}",
				},
			}

			-- Dart CLI adapter (recommended)
			dap.adapters.dart = {
				type = "executable",
				command = "dart",
				args = { "debug_adapter" },
				options = {
					detached = true, -- windows users will need to set 'detached' to false
				},
			}
			dap.adapters.flutter = {
				type = "executable",
				command = "flutter",
				args = { "debug_adapter" },
				options = {
					detached = true, -- windows users will need to set 'detached' to false
				},
			}
		end,
	},
}
