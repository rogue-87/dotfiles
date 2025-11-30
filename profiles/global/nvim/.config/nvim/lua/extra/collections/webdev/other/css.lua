local CSS = {}

CSS.lsp = {}
function CSS.lsp.setup()
	vim.lsp.config("css", {
		cmd = { "vscode-css-language-server", "--stdio" },
		filetypes = { "css", "scss", "less" },
		init_options = { provideFormatter = true }, -- needed to enable formatting capabilities
		root_markers = { "package.json", ".git" },
		settings = {
			css = { validate = true, lint = { unknownAtRules = "ignore" } },
			scss = { validate = true, lint = { unknownAtRules = "ignore" } },
			less = { validate = true, lint = { unknownAtRules = "ignore" } },
		},
	})
	vim.lsp.enable("css")
end

function CSS:setup()
	self.lsp.setup()
end

return CSS
