return {

	-- lsp
	-- comes with a formatter
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
	-- NOTE: still not working
	{
		"mfussenegger/nvim-dap",
		optional = true,
		ft = "dart",
		dependencies = {},
		opts = function()
			local dap = require("dap")
			-- Dart CLI adapter (recommended)
			dap.adapters.dart = {
				type = "executable",
				command = "dart", -- if you're using fvm, you'll need to provide the full path to dart (dart.exe for windows users), or you could prepend the fvm command
				args = { "debug_adapter" },
				-- windows users will need to set 'detached' to false
				options = {
					detached = true,
				},
			}
			dap.adapters.flutter = {
				type = "executable",
				command = "flutter", -- if you're using fvm, you'll need to provide the full path to flutter (flutter.bat for windows users), or you could prepend the fvm command
				args = { "debug_adapter" },
				-- windows users will need to set 'detached' to false
				options = {
					detached = false,
				},
			}

			dap.configurations.dart = {
				{
					type = "dart",
					request = "launch",
					name = "Launch dart",
					dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/bin/dart", -- ensure this is correct
					flutterSdkPath = "/opt/flutter/bin/flutter", -- ensure this is correct
					program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
					cwd = "${workspaceFolder}",
				},
				{
					type = "flutter",
					request = "launch",
					name = "Launch flutter",
					dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/bin/dart", -- ensure this is correct
					flutterSdkPath = "/opt/flutter/bin/flutter", -- ensure this is correct
					program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
					cwd = "${workspaceFolder}",
				},
			}
		end,
	},
}
