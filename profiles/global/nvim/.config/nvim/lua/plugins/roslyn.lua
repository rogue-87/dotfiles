---@type LazySpec
return {
	"seblyng/roslyn.nvim",
	ft = "cs",
	init = function()
		vim.lsp.config("roslyn", {
			cmd = { "csharp-language-server" },
		})
	end,
	---@module 'roslyn.config'
	---@type RoslynNvimConfig
	opts = {},
}
