local Prettier = {}

--- returns prettier formatter configuration for guard.nvim
function Prettier.get()
	return {
		cmd = "prettier",
		args = { "--stdin-filepath" },
		fname = true,
		stdin = true,
	}
end

function Prettier:setup()
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
	]]):fmt(self.get())
end

return Prettier
