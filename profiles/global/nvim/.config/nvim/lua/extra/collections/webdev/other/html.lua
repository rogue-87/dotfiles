local HTML = {}

HTML.lsp = {}
function HTML.lsp.setup()
	vim.lsp.config("html", {
		cmd = { "vscode-html-language-server", "--stdio" },
		filetypes = { "html", "templ" },
		root_markers = { "package.json", ".git" },
		settings = {},
		init_options = {
			provideFormatter = true,
			embeddedLanguages = { css = true, javascript = true },
			configurationSection = { "html", "css", "javascript" },
		},
	})
	vim.lsp.enable("html")
end

function HTML:setup()
	self.lsp.setup()
end

return HTML
