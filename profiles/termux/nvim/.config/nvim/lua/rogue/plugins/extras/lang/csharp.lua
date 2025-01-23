return {
	-- lsp
	-- comes with a formatter
	{
		"neovim/nvim-lspconfig",
		optional = true,
		ft = "cs",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = function()
			local mason = require("mason-registry")
			local omnisharp_dll = mason.get_package("omnisharp"):get_install_path() .. "/libexec/OmniSharp.dll"
			require("lspconfig").omnisharp.setup({
				cmd = { "dotnet", omnisharp_dll },
				settings = {
					FormattingOptions = {
						EnableEditorConfigSupport = true,
						OrganizeImports = nil,
					},
					MsBuild = {
						LoadProjectsOnDemand = nil,
					},
					RoslynExtensionsOptions = {
						EnableAnalyzersSupport = nil,
						EnableImportCompletion = nil,
						AnalyzeOpenDocumentsOnly = nil,
					},
					Sdk = {
						IncludePrereleases = true,
					},
				},
			})
		end,
	},
	-- debugger
	{
		"mfussenegger/nvim-dap",
		optional = true,
		ft = "cs",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = function()
			local dap = require("dap")
			local mason = require("mason-registry")

			local netcoredbg = mason.get_package("netcoredbg"):get_install_path() .. "/netcoredbg"
			dap.adapters.coreclr = {
				type = "executable",
				command = netcoredbg,
				args = { "--interpreter=vscode" },
			}

			dap.configurations.cs = {
				{
					type = "coreclr",
					name = "launch - netcoredbg",
					request = "launch",
					program = function()
						return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
					end,
				},
			}
		end,
	},
}
