if utils.has("guard.nvim") then
	local ft = require("guard.filetype")

	local unstable_extensions = {
		astro = "astro",
		svelte = "svelte",
		vue = "vue",
	}
	local extensions = vim.tbl_extend("keep", {
		css = "css",
		html = "html",
		javascript = "js",
		javascriptreact = "jsx",
		json = "json",
		jsonc = "jsonc",
		less = "less",
		markdown = "md",
		sass = "sass",
		scss = "scss",
		typescript = "ts",
		typescriptreact = "tsx",
		yaml = "yml",
	}, unstable_extensions)

	local deno = {
		cmd = "deno",
		args = function(self, ctx)
			local extension = extensions[vim.bo[ctx.buf].filetype]
			local formatter_args = {
				"fmt",
				"-",
				"--ext",
				extension,
			}

			if unstable_extensions[extension] then
				vim.notify(
					"Adding `--unstable-component` to enable formatting of .%s files. See the Deno documentation for more information: https://docs.deno.com/runtime/reference/cli/formatter/#formatting-options-unstable-component"
						.. extension,
					vim.log.levels.WARN
				)
				formatter_args = vim.list_extend(formatter_args, { "--unstable-component" })
			end

			return formatter_args
		end,
	}

	ft([[
		css,
		html,
		javascript,
		javascriptreact,
		json,
		jsonc,
		markdown,
		scss,
		svelte,
		typescript,
		typescriptreact,
		vue,
		yaml,
	]]):fmt(deno):append("lsp")
end
