return {
	-- lsp
	{
		"neovim/nvim-lspconfig",
		optional = true,
		ft = "cs",
		opts = function()
			local mason = require("mason-registry")
			local omnisharp_dll = mason.get_package("omnisharp"):get_install_path() .. "/libexec/OmniSharp.dll"
			local capabilities = require("rogue.util.capabilities").get()

			require("lspconfig").omnisharp.setup({
				cmd = { "dotnet", omnisharp_dll },
				capabilities = capabilities,
				settings = {
					FormattingOptions = {
						EnableEditorConfigSupport = false,
						OrganizeImports = nil,
						NewLinesForBracesInMethods = false,
						NewLinesForBracesInTypes = false,
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
