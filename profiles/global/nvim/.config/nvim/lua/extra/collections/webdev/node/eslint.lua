local Eslint = {}

local lint = require("guard.lint")
--- returns eslint linter configuration for guard.nvim
function Eslint.get()
	return {
		cmd = "eslint",
		args = { "--format", "json", "--stdin", "--stdin-filename" },
		stdin = true,
		fname = true,
		find = {
			".eslintrc.js",
			".eslintrc.cjs",
			".eslintrc.yaml",
			".eslintrc.yml",
			".eslintrc.json",
			"eslint.config.js",
			"eslint.config.cjs",
			"eslint.config.mjs",
			"eslint.config.ts",
			"eslint.config.cts",
			"eslint.config.mts",
		},
		parse = lint.from_json({
			get_diagnostics = function(...)
				return vim.json.decode(...)[1].messages
			end,
			attributes = {
				lnum = "line",
				end_lnum = "endLine",
				col = "column",
				end_col = "endColumn",
				message = "message",
				code = "ruleId",
			},
			severities = {
				lint.severities.warning,
				lint.severities.error,
			},
			source = "eslint",
		}),
	}
end

function Eslint:setup()
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

return Eslint
