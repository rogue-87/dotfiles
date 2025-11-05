local M = {}

function M.setup()
	vim.lsp.config.html = {
		cmd = { "vscode-html-language-server", "--stdio" },
		filetypes = { "html", "templ" },
		root_markers = { "package.json", ".git" },
		settings = {},
		init_options = {
			provideFormatter = true,
			embeddedLanguages = { css = true, javascript = true },
			configurationSection = { "html", "css", "javascript" },
		},
	}

	vim.lsp.config.css = {
		cmd = { "vscode-css-language-server", "--stdio" },
		filetypes = { "css", "scss", "less" },
		init_options = { provideFormatter = true }, -- needed to enable formatting capabilities
		root_markers = { "package.json", ".git" },
		settings = {
			css = { validate = true, lint = { unknownAtRules = "ignore" } },
			scss = { validate = true, lint = { unknownAtRules = "ignore" } },
			less = { validate = true, lint = { unknownAtRules = "ignore" } },
		},
	}

	vim.lsp.config.css_vars = {
		cmd = { "css-variables-language-server", "--stdio" },
		filetypes = { "css", "scss", "less" },
		root_markers = { "package.json", ".git" },
		settings = {
			cssVariables = {
				lookupFiles = {
					"**/*.less",
					"**/*.scss",
					"**/*.sass",
					"**/*.css",

					"src/lib/style/abstracts/colorscheme.css",
					"src/lib/style/abstracts/variables.css",
				},
				blacklistFolders = {
					"**/.cache",
					"**/.DS_Store",
					"**/.git",
					"**/.hg",
					"**/.next",
					"**/.svn",
					"**/bower_components",
					"**/CVS",
					"**/dist",
					"**/node_modules",
					"**/tests",
					"**/tmp",
				},
			},
		},
	}

	vim.lsp.enable({
		"html",
		"css",
		"css_vars",
	})
end

return M
