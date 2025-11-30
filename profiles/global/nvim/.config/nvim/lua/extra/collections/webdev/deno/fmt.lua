local Fmt = {}

function Fmt.get()
	local extensions = {
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
		-- WARN: unstable filetypes
		-- astro = "astro",
		-- svelte = "svelte",
		-- vue = "vue",
	}

	return {
		cmd = "deno",
		args = function(buf)
			local extension = extensions[vim.bo[buf].filetype]
			return { "fmt", "-", "--ext", extension } ---@as string[]
		end,
		fname = true,
		stdin = true,
	}
end

function Fmt:setup()
	if not utils.has("guard.nvim") then
		vim.notify("guard.nvim plugin is not installed/loaded.\nAborting `deno fmt` setup", vim.log.levels.WARN)
		return
	end

	local ft = require("guard.filetype")
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
	]]):fmt(self.get()):append("lsp")
end

return Fmt
