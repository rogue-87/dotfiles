---@type LazySpec
return {
	"nvimdev/guard.nvim",
	dependencies = { "nvimdev/guard-collection" },
	lazy = false,
	init = function()
		vim.g.guard_config = {
			lsp_as_default_formatter = true,
			fmt_on_save = false,
			save_on_fmt = false,
			auto_lint = true,
			lint_interval = 500,
			refresh_diagnostic = true,
			always_save = false,
		}
	end,
	config = function()
		local ft = require("guard.filetype")
		local deno = require("extra.collections.webdev.deno")

		ft("bash"):fmt("shfmt")
		ft("markdown,json,jsonc,yaml"):fmt(deno.fmt.get())
		ft("lua"):fmt("stylua")
		ft("luau"):fmt("stylua")
		ft("python"):fmt("ruff")
		ft("rust"):fmt("rustfmt")
		ft("toml"):fmt("taplo")
		ft("typst"):fmt("typstyle")
		ft("xml"):fmt("xmllint")
		ft("zig"):fmt("zigfmt")
	end,
	keys = {
		{ "<localleader>df", "<cmd>Guard fmt<cr>", desc = "format", mode = { "n", "v" } },
	},
}
