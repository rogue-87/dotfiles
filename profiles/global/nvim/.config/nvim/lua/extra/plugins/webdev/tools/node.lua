---@type LazySpec
return {
	"nvimdev/guard.nvim",
	optional = true,
	config = function()
		local ft = require("guard.filetype")

		ft([[
			html,
			css,
			scss,
			javascript,
			typescript,
			javascriptreact,
			typescriptreact
		]]):fmt("prettier"):lint("lint")
	end,
}
