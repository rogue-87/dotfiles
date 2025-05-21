return {
	"seblyng/roslyn.nvim",
	ft = "cs",
	---@module 'roslyn.config'
	---@type RoslynNvimConfig
	opts = {
		config = {
			cmd = {
				"Microsoft.CodeAnalysis.LanguageServer",
				"--logLevel=Information",
				"--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
				"--stdio",
			},
		},
	},
}
