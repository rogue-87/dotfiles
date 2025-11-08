if utils.has("guard.nvim") then
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
	]])
		:fmt("prettier")
		:append("lsp")
		:lint("eslint")
end
